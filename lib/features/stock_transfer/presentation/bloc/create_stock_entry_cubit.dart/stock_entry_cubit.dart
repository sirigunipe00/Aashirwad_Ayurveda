
import 'package:aashirwad/features/stock_transfer/data/stock_entry_repo.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_entry.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'stock_entry_cubit.freezed.dart';

@injectable
class NewStockEntryCubit extends Cubit<NewStockEntryState> {
  NewStockEntryCubit(this._repo) : super(const NewStockEntryState.initial());
  final StockEntryRepo _repo;

  Future<void> createEntry(String barcode) async {
  emit(const NewStockEntryState.creating());

  final result = await _repo.createStockEntry(
    StockEntry(
      stockEntryType: 'Material Transfer',
      fromWarehouse: 'FQC Warehouse - RCPL',
      toWarehouse: 'Finished Goods - RCPL',
      scanBarcode: barcode,
    ),
  );

  await result.fold(
    (err) async {
      emit(NewStockEntryState.error(err.error));
    },
    (name) async {
      final entryResult = await _repo.fetchStockEntry(name);
      final itemsResult = await _repo.fetchStockEntryDetails(name);

      entryResult.fold(
        (err) => emit(NewStockEntryState.error(err.error)),
        (entry) {
          itemsResult.fold(
            (err) => emit(NewStockEntryState.error(err.error)),
            (items) => emit(
              NewStockEntryState.ready(
                stockEntryName: name,
                stockEntry: entry,
                items: items,
                isScanning: false,
                isSubmitting: false,
              ),
            ),
          );
        },
      );
    },
  );
}
void reset() {
  emit(const NewStockEntryState.initial());
}
  Future<void> loadEntry(String name) async {
  emit(const NewStockEntryState.creating());

  try {
    final entryResult = await _repo.fetchStockEntry(name);
    final itemsResult = await _repo.fetchStockEntryDetails(name);

    entryResult.fold(
      (err) => emit(NewStockEntryState.error(err.error)),
      (entry) {
        itemsResult.fold(
          (err) => emit(NewStockEntryState.error(err.error)),
          (items) => emit(
            NewStockEntryState.ready(
              stockEntryName: name,
              stockEntry: entry,
              items: items,
              isScanning: false,
              isSubmitting: false,
            ),
          ),
        );
      },
    );
  } catch (e) {
    emit(NewStockEntryState.error(e.toString()));
  }
}

Future<void> scanSerial(String serial) async {
  final cleaned = serial.trim(); // ← trims \n, spaces, \r
  if (cleaned.isEmpty) return;
  
  final current = state;

  if (current is! _Ready ||
      current.stockEntryName == null ||
      current.stockEntryName == 'null' ||
      current.stockEntryName!.isEmpty) {
    await createEntry(cleaned); // ← use cleaned
    return;
  }

  emit(current.copyWith(isScanning: true));
  final updateResult = await _repo.updateStockEntry(
    current.stockEntryName!,
    cleaned, // ← use cleaned
  );

  await updateResult.fold(
    (err) async {
      emit(current.copyWith(
        isScanning: false,
        scanError: err.error,
      ));
    },
    (updated) async {
      final itemsResult = await _repo.fetchStockEntryDetails(
        current.stockEntryName!,
      );

      itemsResult.fold(
        (err) => emit(
          current.copyWith(
            isScanning: false,
            scanError: err.error,
          ),
        ),
        (items) => emit(
          current.copyWith(
            isScanning: false,
            stockEntry: updated,
            items: items,
            scanError: null,
          ),
        ),
      );
    },
  );
}

  Future<void> submitTransfer(String stockEntryName) async {
    final current = state;
    if (current is! _Ready) return;
    emit(current.copyWith(isSubmitting: true));
    final result = await _repo.submitStockEntry(stockEntryName);
    result.fold(
      (err) => emit(current.copyWith(isSubmitting: false, scanError: err.error)),
      (_) => emit(const NewStockEntryState.submitted()),
    );
  }
}
@freezed
class NewStockEntryState with _$NewStockEntryState {
  const factory NewStockEntryState.initial() = _Initial;
  const factory NewStockEntryState.creating() = _Creating;
  const factory NewStockEntryState.ready({
     String? stockEntryName,
    StockEntry? stockEntry,
    @Default([]) List<StockItems> items,
    @Default(false) bool isScanning,
    @Default(false) bool isSubmitting,
    String? scanError,
  }) = _Ready;
  const factory NewStockEntryState.submitted() = _Submitted;
  const factory NewStockEntryState.error(String message) = _Error;
}