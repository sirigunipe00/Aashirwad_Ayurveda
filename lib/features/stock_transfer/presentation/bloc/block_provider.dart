import 'package:aashirwad/core/cubit/infinite_list/infinite_list_cubit.dart';
import 'package:aashirwad/core/cubit/network_request/network_request_cubit.dart';
import 'package:aashirwad/core/di/injector.dart';
import 'package:aashirwad/core/model/pair.dart';
import 'package:aashirwad/features/stock_transfer/data/stock_entry_repo.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_entry.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_items.dart';
import 'package:injectable/injectable.dart';

typedef StockEntriesCubit =
    InfiniteListCubit<StockEntry, Pair<int?, String?>, Pair<int?, String?>>;
typedef StockEntriesCubitState = InfiniteListState<StockEntry>;
typedef StockItemsCubit
    = NetworkRequestCubit<List<StockItems>, String>;
typedef StockItemsState
    = NetworkRequestState<List<StockItems>>;

@lazySingleton
class StockEntryBlocProvider {
  const StockEntryBlocProvider(this.repo);

  final StockEntryRepo repo;

  static StockEntryBlocProvider get() => $sl.get<StockEntryBlocProvider>();

  StockEntriesCubit fetchStockEntries() => StockEntriesCubit(
  
    requestInitial:
        (params, state) => repo.fetchStockEntries(0, params!.first, params.second),
    requestMore:
        (params, state) =>
            repo.fetchStockEntries(state.curLength, params!.first, params.second),
  );
  StockItemsCubit getStockItems() => StockItemsCubit(
    onRequest: (params, state) => repo.fetchStockEntryDetails(params ?? ''),
  );
}