// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gaylord_items_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GaylordItemsForm _$GaylordItemsFormFromJson(Map<String, dynamic> json) {
  return _GaylordItemsForm.fromJson(json);
}

/// @nodoc
mixin _$GaylordItemsForm {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'scan_value')
  String? get scanValue => throw _privateConstructorUsedError;

  /// Serializes this GaylordItemsForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GaylordItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GaylordItemsFormCopyWith<GaylordItemsForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GaylordItemsFormCopyWith<$Res> {
  factory $GaylordItemsFormCopyWith(
          GaylordItemsForm value, $Res Function(GaylordItemsForm) then) =
      _$GaylordItemsFormCopyWithImpl<$Res, GaylordItemsForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'scan_value') String? scanValue});
}

/// @nodoc
class _$GaylordItemsFormCopyWithImpl<$Res, $Val extends GaylordItemsForm>
    implements $GaylordItemsFormCopyWith<$Res> {
  _$GaylordItemsFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GaylordItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? scanValue = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      scanValue: freezed == scanValue
          ? _value.scanValue
          : scanValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GaylordItemsFormImplCopyWith<$Res>
    implements $GaylordItemsFormCopyWith<$Res> {
  factory _$$GaylordItemsFormImplCopyWith(_$GaylordItemsFormImpl value,
          $Res Function(_$GaylordItemsFormImpl) then) =
      __$$GaylordItemsFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'scan_value') String? scanValue});
}

/// @nodoc
class __$$GaylordItemsFormImplCopyWithImpl<$Res>
    extends _$GaylordItemsFormCopyWithImpl<$Res, _$GaylordItemsFormImpl>
    implements _$$GaylordItemsFormImplCopyWith<$Res> {
  __$$GaylordItemsFormImplCopyWithImpl(_$GaylordItemsFormImpl _value,
      $Res Function(_$GaylordItemsFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of GaylordItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? scanValue = freezed,
  }) {
    return _then(_$GaylordItemsFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      scanValue: freezed == scanValue
          ? _value.scanValue
          : scanValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GaylordItemsFormImpl implements _GaylordItemsForm {
  _$GaylordItemsFormImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'scan_value') this.scanValue});

  factory _$GaylordItemsFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$GaylordItemsFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'scan_value')
  final String? scanValue;

  @override
  String toString() {
    return 'GaylordItemsForm(name: $name, scanValue: $scanValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GaylordItemsFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.scanValue, scanValue) ||
                other.scanValue == scanValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, scanValue);

  /// Create a copy of GaylordItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GaylordItemsFormImplCopyWith<_$GaylordItemsFormImpl> get copyWith =>
      __$$GaylordItemsFormImplCopyWithImpl<_$GaylordItemsFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GaylordItemsFormImplToJson(
      this,
    );
  }
}

abstract class _GaylordItemsForm implements GaylordItemsForm {
  factory _GaylordItemsForm(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'scan_value') final String? scanValue}) =
      _$GaylordItemsFormImpl;

  factory _GaylordItemsForm.fromJson(Map<String, dynamic> json) =
      _$GaylordItemsFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'scan_value')
  String? get scanValue;

  /// Create a copy of GaylordItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GaylordItemsFormImplCopyWith<_$GaylordItemsFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
