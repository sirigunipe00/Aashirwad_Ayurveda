// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockItemsImpl _$$StockItemsImplFromJson(Map<String, dynamic> json) =>
    _$StockItemsImpl(
      name: json['name'] as String?,
      parent: json['parent'] as String?,
      barcode: json['barcode'] as String?,
      serialNo: json['serial_no'] as String?,
      itemCode: json['item_code'] as String?,
      itemName: json['item_name'] as String?,
      itemGroup: json['item_group'] as String?,
      sourceWarehouse: json['s_warehouse'] as String?,
      targetWarehouse: json['t_warehouse'] as String?,
      qty: (json['qty'] as num?)?.toDouble(),
      uom: json['uom'] as String?,
      basicRate: (json['basic_rate'] as num?)?.toDouble(),
      basicAmount: (json['basic_amount'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      expenseAccount: json['expense_account'] as String?,
      costCenter: json['cost_center'] as String?,
    );

Map<String, dynamic> _$$StockItemsImplToJson(_$StockItemsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'parent': instance.parent,
      'barcode': instance.barcode,
      'serial_no': instance.serialNo,
      'item_code': instance.itemCode,
      'item_name': instance.itemName,
      'item_group': instance.itemGroup,
      's_warehouse': instance.sourceWarehouse,
      't_warehouse': instance.targetWarehouse,
      'qty': instance.qty,
      'uom': instance.uom,
      'basic_rate': instance.basicRate,
      'basic_amount': instance.basicAmount,
      'amount': instance.amount,
      'expense_account': instance.expenseAccount,
      'cost_center': instance.costCenter,
    };
