// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockItems _$StockItemsFromJson(Map<String, dynamic> json) {
  return _StockItems.fromJson(json);
}

/// @nodoc
mixin _$StockItems {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent')
  String? get parent => throw _privateConstructorUsedError;
  @JsonKey(name: 'barcode')
  String? get barcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_no')
  String? get serialNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_code')
  String? get itemCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String? get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_group')
  String? get itemGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 's_warehouse')
  String? get sourceWarehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 't_warehouse')
  String? get targetWarehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  double? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'uom')
  String? get uom => throw _privateConstructorUsedError;
  @JsonKey(name: 'basic_rate')
  double? get basicRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'basic_amount')
  double? get basicAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'expense_account')
  String? get expenseAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'cost_center')
  String? get costCenter => throw _privateConstructorUsedError;

  /// Serializes this StockItems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockItemsCopyWith<StockItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockItemsCopyWith<$Res> {
  factory $StockItemsCopyWith(
          StockItems value, $Res Function(StockItems) then) =
      _$StockItemsCopyWithImpl<$Res, StockItems>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
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
      @JsonKey(name: 'cost_center') String? costCenter});
}

/// @nodoc
class _$StockItemsCopyWithImpl<$Res, $Val extends StockItems>
    implements $StockItemsCopyWith<$Res> {
  _$StockItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? parent = freezed,
    Object? barcode = freezed,
    Object? serialNo = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? itemGroup = freezed,
    Object? sourceWarehouse = freezed,
    Object? targetWarehouse = freezed,
    Object? qty = freezed,
    Object? uom = freezed,
    Object? basicRate = freezed,
    Object? basicAmount = freezed,
    Object? amount = freezed,
    Object? expenseAccount = freezed,
    Object? costCenter = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNo: freezed == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemGroup: freezed == itemGroup
          ? _value.itemGroup
          : itemGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceWarehouse: freezed == sourceWarehouse
          ? _value.sourceWarehouse
          : sourceWarehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      targetWarehouse: freezed == targetWarehouse
          ? _value.targetWarehouse
          : targetWarehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      basicRate: freezed == basicRate
          ? _value.basicRate
          : basicRate // ignore: cast_nullable_to_non_nullable
              as double?,
      basicAmount: freezed == basicAmount
          ? _value.basicAmount
          : basicAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      expenseAccount: freezed == expenseAccount
          ? _value.expenseAccount
          : expenseAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      costCenter: freezed == costCenter
          ? _value.costCenter
          : costCenter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockItemsImplCopyWith<$Res>
    implements $StockItemsCopyWith<$Res> {
  factory _$$StockItemsImplCopyWith(
          _$StockItemsImpl value, $Res Function(_$StockItemsImpl) then) =
      __$$StockItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
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
      @JsonKey(name: 'cost_center') String? costCenter});
}

/// @nodoc
class __$$StockItemsImplCopyWithImpl<$Res>
    extends _$StockItemsCopyWithImpl<$Res, _$StockItemsImpl>
    implements _$$StockItemsImplCopyWith<$Res> {
  __$$StockItemsImplCopyWithImpl(
      _$StockItemsImpl _value, $Res Function(_$StockItemsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? parent = freezed,
    Object? barcode = freezed,
    Object? serialNo = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? itemGroup = freezed,
    Object? sourceWarehouse = freezed,
    Object? targetWarehouse = freezed,
    Object? qty = freezed,
    Object? uom = freezed,
    Object? basicRate = freezed,
    Object? basicAmount = freezed,
    Object? amount = freezed,
    Object? expenseAccount = freezed,
    Object? costCenter = freezed,
  }) {
    return _then(_$StockItemsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNo: freezed == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemGroup: freezed == itemGroup
          ? _value.itemGroup
          : itemGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceWarehouse: freezed == sourceWarehouse
          ? _value.sourceWarehouse
          : sourceWarehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      targetWarehouse: freezed == targetWarehouse
          ? _value.targetWarehouse
          : targetWarehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      basicRate: freezed == basicRate
          ? _value.basicRate
          : basicRate // ignore: cast_nullable_to_non_nullable
              as double?,
      basicAmount: freezed == basicAmount
          ? _value.basicAmount
          : basicAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      expenseAccount: freezed == expenseAccount
          ? _value.expenseAccount
          : expenseAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      costCenter: freezed == costCenter
          ? _value.costCenter
          : costCenter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockItemsImpl implements _StockItems {
  const _$StockItemsImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'parent') this.parent,
      @JsonKey(name: 'barcode') this.barcode,
      @JsonKey(name: 'serial_no') this.serialNo,
      @JsonKey(name: 'item_code') this.itemCode,
      @JsonKey(name: 'item_name') this.itemName,
      @JsonKey(name: 'item_group') this.itemGroup,
      @JsonKey(name: 's_warehouse') this.sourceWarehouse,
      @JsonKey(name: 't_warehouse') this.targetWarehouse,
      @JsonKey(name: 'qty') this.qty,
      @JsonKey(name: 'uom') this.uom,
      @JsonKey(name: 'basic_rate') this.basicRate,
      @JsonKey(name: 'basic_amount') this.basicAmount,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'expense_account') this.expenseAccount,
      @JsonKey(name: 'cost_center') this.costCenter});

  factory _$StockItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockItemsImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'parent')
  final String? parent;
  @override
  @JsonKey(name: 'barcode')
  final String? barcode;
  @override
  @JsonKey(name: 'serial_no')
  final String? serialNo;
  @override
  @JsonKey(name: 'item_code')
  final String? itemCode;
  @override
  @JsonKey(name: 'item_name')
  final String? itemName;
  @override
  @JsonKey(name: 'item_group')
  final String? itemGroup;
  @override
  @JsonKey(name: 's_warehouse')
  final String? sourceWarehouse;
  @override
  @JsonKey(name: 't_warehouse')
  final String? targetWarehouse;
  @override
  @JsonKey(name: 'qty')
  final double? qty;
  @override
  @JsonKey(name: 'uom')
  final String? uom;
  @override
  @JsonKey(name: 'basic_rate')
  final double? basicRate;
  @override
  @JsonKey(name: 'basic_amount')
  final double? basicAmount;
  @override
  @JsonKey(name: 'amount')
  final double? amount;
  @override
  @JsonKey(name: 'expense_account')
  final String? expenseAccount;
  @override
  @JsonKey(name: 'cost_center')
  final String? costCenter;

  @override
  String toString() {
    return 'StockItems(name: $name, parent: $parent, barcode: $barcode, serialNo: $serialNo, itemCode: $itemCode, itemName: $itemName, itemGroup: $itemGroup, sourceWarehouse: $sourceWarehouse, targetWarehouse: $targetWarehouse, qty: $qty, uom: $uom, basicRate: $basicRate, basicAmount: $basicAmount, amount: $amount, expenseAccount: $expenseAccount, costCenter: $costCenter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockItemsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.serialNo, serialNo) ||
                other.serialNo == serialNo) &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemGroup, itemGroup) ||
                other.itemGroup == itemGroup) &&
            (identical(other.sourceWarehouse, sourceWarehouse) ||
                other.sourceWarehouse == sourceWarehouse) &&
            (identical(other.targetWarehouse, targetWarehouse) ||
                other.targetWarehouse == targetWarehouse) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.basicRate, basicRate) ||
                other.basicRate == basicRate) &&
            (identical(other.basicAmount, basicAmount) ||
                other.basicAmount == basicAmount) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.expenseAccount, expenseAccount) ||
                other.expenseAccount == expenseAccount) &&
            (identical(other.costCenter, costCenter) ||
                other.costCenter == costCenter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      parent,
      barcode,
      serialNo,
      itemCode,
      itemName,
      itemGroup,
      sourceWarehouse,
      targetWarehouse,
      qty,
      uom,
      basicRate,
      basicAmount,
      amount,
      expenseAccount,
      costCenter);

  /// Create a copy of StockItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockItemsImplCopyWith<_$StockItemsImpl> get copyWith =>
      __$$StockItemsImplCopyWithImpl<_$StockItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockItemsImplToJson(
      this,
    );
  }
}

abstract class _StockItems implements StockItems {
  const factory _StockItems(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'parent') final String? parent,
          @JsonKey(name: 'barcode') final String? barcode,
          @JsonKey(name: 'serial_no') final String? serialNo,
          @JsonKey(name: 'item_code') final String? itemCode,
          @JsonKey(name: 'item_name') final String? itemName,
          @JsonKey(name: 'item_group') final String? itemGroup,
          @JsonKey(name: 's_warehouse') final String? sourceWarehouse,
          @JsonKey(name: 't_warehouse') final String? targetWarehouse,
          @JsonKey(name: 'qty') final double? qty,
          @JsonKey(name: 'uom') final String? uom,
          @JsonKey(name: 'basic_rate') final double? basicRate,
          @JsonKey(name: 'basic_amount') final double? basicAmount,
          @JsonKey(name: 'amount') final double? amount,
          @JsonKey(name: 'expense_account') final String? expenseAccount,
          @JsonKey(name: 'cost_center') final String? costCenter}) =
      _$StockItemsImpl;

  factory _StockItems.fromJson(Map<String, dynamic> json) =
      _$StockItemsImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'parent')
  String? get parent;
  @override
  @JsonKey(name: 'barcode')
  String? get barcode;
  @override
  @JsonKey(name: 'serial_no')
  String? get serialNo;
  @override
  @JsonKey(name: 'item_code')
  String? get itemCode;
  @override
  @JsonKey(name: 'item_name')
  String? get itemName;
  @override
  @JsonKey(name: 'item_group')
  String? get itemGroup;
  @override
  @JsonKey(name: 's_warehouse')
  String? get sourceWarehouse;
  @override
  @JsonKey(name: 't_warehouse')
  String? get targetWarehouse;
  @override
  @JsonKey(name: 'qty')
  double? get qty;
  @override
  @JsonKey(name: 'uom')
  String? get uom;
  @override
  @JsonKey(name: 'basic_rate')
  double? get basicRate;
  @override
  @JsonKey(name: 'basic_amount')
  double? get basicAmount;
  @override
  @JsonKey(name: 'amount')
  double? get amount;
  @override
  @JsonKey(name: 'expense_account')
  String? get expenseAccount;
  @override
  @JsonKey(name: 'cost_center')
  String? get costCenter;

  /// Create a copy of StockItems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockItemsImplCopyWith<_$StockItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
