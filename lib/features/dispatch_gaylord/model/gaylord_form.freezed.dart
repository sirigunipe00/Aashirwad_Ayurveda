// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gaylord_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GaylordForm _$GaylordFormFromJson(Map<String, dynamic> json) {
  return _GaylordForm.fromJson(json);
}

/// @nodoc
mixin _$GaylordForm {
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'posting_date')
  String get currentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'posting_time')
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  String get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;

  /// Serializes this GaylordForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GaylordForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GaylordFormCopyWith<GaylordForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GaylordFormCopyWith<$Res> {
  factory $GaylordFormCopyWith(
          GaylordForm value, $Res Function(GaylordForm) then) =
      _$GaylordFormCopyWithImpl<$Res, GaylordForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'posting_date') String currentDate,
      @JsonKey(name: 'posting_time') String time,
      @JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'customer_name') String customerName});
}

/// @nodoc
class _$GaylordFormCopyWithImpl<$Res, $Val extends GaylordForm>
    implements $GaylordFormCopyWith<$Res> {
  _$GaylordFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GaylordForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = null,
    Object? currentDate = null,
    Object? time = null,
    Object? customer = null,
    Object? customerName = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GaylordFormImplCopyWith<$Res>
    implements $GaylordFormCopyWith<$Res> {
  factory _$$GaylordFormImplCopyWith(
          _$GaylordFormImpl value, $Res Function(_$GaylordFormImpl) then) =
      __$$GaylordFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'posting_date') String currentDate,
      @JsonKey(name: 'posting_time') String time,
      @JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'customer_name') String customerName});
}

/// @nodoc
class __$$GaylordFormImplCopyWithImpl<$Res>
    extends _$GaylordFormCopyWithImpl<$Res, _$GaylordFormImpl>
    implements _$$GaylordFormImplCopyWith<$Res> {
  __$$GaylordFormImplCopyWithImpl(
      _$GaylordFormImpl _value, $Res Function(_$GaylordFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of GaylordForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = null,
    Object? currentDate = null,
    Object? time = null,
    Object? customer = null,
    Object? customerName = null,
  }) {
    return _then(_$GaylordFormImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentDate: null == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GaylordFormImpl implements _GaylordForm {
  _$GaylordFormImpl(
      {@JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'posting_date') required this.currentDate,
      @JsonKey(name: 'posting_time') required this.time,
      @JsonKey(name: 'customer') required this.customer,
      @JsonKey(name: 'customer_name') required this.customerName});

  factory _$GaylordFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$GaylordFormImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'posting_date')
  final String currentDate;
  @override
  @JsonKey(name: 'posting_time')
  final String time;
  @override
  @JsonKey(name: 'customer')
  final String customer;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;

  @override
  String toString() {
    return 'GaylordForm(status: $status, name: $name, currentDate: $currentDate, time: $time, customer: $customer, customerName: $customerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GaylordFormImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, name, currentDate, time, customer, customerName);

  /// Create a copy of GaylordForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GaylordFormImplCopyWith<_$GaylordFormImpl> get copyWith =>
      __$$GaylordFormImplCopyWithImpl<_$GaylordFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GaylordFormImplToJson(
      this,
    );
  }
}

abstract class _GaylordForm implements GaylordForm {
  factory _GaylordForm(
          {@JsonKey(name: 'status') required final String status,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'posting_date') required final String currentDate,
          @JsonKey(name: 'posting_time') required final String time,
          @JsonKey(name: 'customer') required final String customer,
          @JsonKey(name: 'customer_name') required final String customerName}) =
      _$GaylordFormImpl;

  factory _GaylordForm.fromJson(Map<String, dynamic> json) =
      _$GaylordFormImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'posting_date')
  String get currentDate;
  @override
  @JsonKey(name: 'posting_time')
  String get time;
  @override
  @JsonKey(name: 'customer')
  String get customer;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;

  /// Create a copy of GaylordForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GaylordFormImplCopyWith<_$GaylordFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
