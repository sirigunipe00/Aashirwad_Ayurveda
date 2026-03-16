// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_details_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeeDetailsForm _$EmployeeDetailsFormFromJson(Map<String, dynamic> json) {
  return _EmployeeDetailsForm.fromJson(json);
}

/// @nodoc
mixin _$EmployeeDetailsForm {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_name', defaultValue: '')
  String get employeeName => throw _privateConstructorUsedError;

  /// Serializes this EmployeeDetailsForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeDetailsForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeDetailsFormCopyWith<EmployeeDetailsForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeDetailsFormCopyWith<$Res> {
  factory $EmployeeDetailsFormCopyWith(
          EmployeeDetailsForm value, $Res Function(EmployeeDetailsForm) then) =
      _$EmployeeDetailsFormCopyWithImpl<$Res, EmployeeDetailsForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'employee_name', defaultValue: '') String employeeName});
}

/// @nodoc
class _$EmployeeDetailsFormCopyWithImpl<$Res, $Val extends EmployeeDetailsForm>
    implements $EmployeeDetailsFormCopyWith<$Res> {
  _$EmployeeDetailsFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeDetailsForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? employeeName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeDetailsFormImplCopyWith<$Res>
    implements $EmployeeDetailsFormCopyWith<$Res> {
  factory _$$EmployeeDetailsFormImplCopyWith(_$EmployeeDetailsFormImpl value,
          $Res Function(_$EmployeeDetailsFormImpl) then) =
      __$$EmployeeDetailsFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'employee_name', defaultValue: '') String employeeName});
}

/// @nodoc
class __$$EmployeeDetailsFormImplCopyWithImpl<$Res>
    extends _$EmployeeDetailsFormCopyWithImpl<$Res, _$EmployeeDetailsFormImpl>
    implements _$$EmployeeDetailsFormImplCopyWith<$Res> {
  __$$EmployeeDetailsFormImplCopyWithImpl(_$EmployeeDetailsFormImpl _value,
      $Res Function(_$EmployeeDetailsFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeDetailsForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? employeeName = null,
  }) {
    return _then(_$EmployeeDetailsFormImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeDetailsFormImpl implements _EmployeeDetailsForm {
  _$EmployeeDetailsFormImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'employee_name', defaultValue: '')
      required this.employeeName});

  factory _$EmployeeDetailsFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeDetailsFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'employee_name', defaultValue: '')
  final String employeeName;

  @override
  String toString() {
    return 'EmployeeDetailsForm(name: $name, employeeName: $employeeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeDetailsFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, employeeName);

  /// Create a copy of EmployeeDetailsForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeDetailsFormImplCopyWith<_$EmployeeDetailsFormImpl> get copyWith =>
      __$$EmployeeDetailsFormImplCopyWithImpl<_$EmployeeDetailsFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeDetailsFormImplToJson(
      this,
    );
  }
}

abstract class _EmployeeDetailsForm implements EmployeeDetailsForm {
  factory _EmployeeDetailsForm(
      {@JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'employee_name', defaultValue: '')
      required final String employeeName}) = _$EmployeeDetailsFormImpl;

  factory _EmployeeDetailsForm.fromJson(Map<String, dynamic> json) =
      _$EmployeeDetailsFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'employee_name', defaultValue: '')
  String get employeeName;

  /// Create a copy of EmployeeDetailsForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeDetailsFormImplCopyWith<_$EmployeeDetailsFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
