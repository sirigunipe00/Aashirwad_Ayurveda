import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_items.freezed.dart';
part 'stock_items.g.dart';

@freezed
class StockItems with _$StockItems {
  const factory StockItems({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'parent') String? parent,

    @JsonKey(name: 'barcode') String? barcode,
    @JsonKey(name: 'serial_no') String? serialNo,

    @JsonKey(name: 'item_code') String? itemCode,
    @JsonKey(name: 'item_name') String? itemName,
    @JsonKey(name: 'item_group') String? itemGroup,

    @JsonKey(name: 's_warehouse') String? sourceWarehouse,
    @JsonKey(name: 't_warehouse') String? targetWarehouse,

    @JsonKey(name: 'qty') double? qty,
    @JsonKey(name: 'uom') String? uom,

    @JsonKey(name: 'basic_rate') double? basicRate,
    @JsonKey(name: 'basic_amount') double? basicAmount,
    @JsonKey(name: 'amount') double? amount,

    @JsonKey(name: 'expense_account') String? expenseAccount,
    @JsonKey(name: 'cost_center') String? costCenter,
  }) = _StockItems;

  factory StockItems.fromJson(Map<String, dynamic> json) =>
      _$StockItemsFromJson(json);
}