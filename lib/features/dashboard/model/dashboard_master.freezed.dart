// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_master.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardMaster _$DashboardMasterFromJson(Map<String, dynamic> json) {
  return _DashboardMaster.fromJson(json);
}

/// @nodoc
mixin _$DashboardMaster {
  String get name => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favourite', defaultValue: false)
  bool get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: 'charts_count')
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified')
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_count')
  int get viewCount => throw _privateConstructorUsedError;

  /// Serializes this DashboardMaster to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardMaster
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardMasterCopyWith<DashboardMaster> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardMasterCopyWith<$Res> {
  factory $DashboardMasterCopyWith(
          DashboardMaster value, $Res Function(DashboardMaster) then) =
      _$DashboardMasterCopyWithImpl<$Res, DashboardMaster>;
  @useResult
  $Res call(
      {String name,
      String title,
      @JsonKey(name: 'is_favourite', defaultValue: false) bool isFavourite,
      @JsonKey(name: 'charts_count') int count,
      @JsonKey(name: 'modified') String time,
      @JsonKey(name: 'view_count') int viewCount});
}

/// @nodoc
class _$DashboardMasterCopyWithImpl<$Res, $Val extends DashboardMaster>
    implements $DashboardMasterCopyWith<$Res> {
  _$DashboardMasterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardMaster
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? isFavourite = null,
    Object? count = null,
    Object? time = null,
    Object? viewCount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardMasterImplCopyWith<$Res>
    implements $DashboardMasterCopyWith<$Res> {
  factory _$$DashboardMasterImplCopyWith(_$DashboardMasterImpl value,
          $Res Function(_$DashboardMasterImpl) then) =
      __$$DashboardMasterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String title,
      @JsonKey(name: 'is_favourite', defaultValue: false) bool isFavourite,
      @JsonKey(name: 'charts_count') int count,
      @JsonKey(name: 'modified') String time,
      @JsonKey(name: 'view_count') int viewCount});
}

/// @nodoc
class __$$DashboardMasterImplCopyWithImpl<$Res>
    extends _$DashboardMasterCopyWithImpl<$Res, _$DashboardMasterImpl>
    implements _$$DashboardMasterImplCopyWith<$Res> {
  __$$DashboardMasterImplCopyWithImpl(
      _$DashboardMasterImpl _value, $Res Function(_$DashboardMasterImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardMaster
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? isFavourite = null,
    Object? count = null,
    Object? time = null,
    Object? viewCount = null,
  }) {
    return _then(_$DashboardMasterImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardMasterImpl implements _DashboardMaster {
  const _$DashboardMasterImpl(
      {required this.name,
      required this.title,
      @JsonKey(name: 'is_favourite', defaultValue: false)
      required this.isFavourite,
      @JsonKey(name: 'charts_count') required this.count,
      @JsonKey(name: 'modified') required this.time,
      @JsonKey(name: 'view_count') required this.viewCount});

  factory _$DashboardMasterImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardMasterImplFromJson(json);

  @override
  final String name;
  @override
  final String title;
  @override
  @JsonKey(name: 'is_favourite', defaultValue: false)
  final bool isFavourite;
  @override
  @JsonKey(name: 'charts_count')
  final int count;
  @override
  @JsonKey(name: 'modified')
  final String time;
  @override
  @JsonKey(name: 'view_count')
  final int viewCount;

  @override
  String toString() {
    return 'DashboardMaster(name: $name, title: $title, isFavourite: $isFavourite, count: $count, time: $time, viewCount: $viewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardMasterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, title, isFavourite, count, time, viewCount);

  /// Create a copy of DashboardMaster
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardMasterImplCopyWith<_$DashboardMasterImpl> get copyWith =>
      __$$DashboardMasterImplCopyWithImpl<_$DashboardMasterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardMasterImplToJson(
      this,
    );
  }
}

abstract class _DashboardMaster implements DashboardMaster {
  const factory _DashboardMaster(
          {required final String name,
          required final String title,
          @JsonKey(name: 'is_favourite', defaultValue: false)
          required final bool isFavourite,
          @JsonKey(name: 'charts_count') required final int count,
          @JsonKey(name: 'modified') required final String time,
          @JsonKey(name: 'view_count') required final int viewCount}) =
      _$DashboardMasterImpl;

  factory _DashboardMaster.fromJson(Map<String, dynamic> json) =
      _$DashboardMasterImpl.fromJson;

  @override
  String get name;
  @override
  String get title;
  @override
  @JsonKey(name: 'is_favourite', defaultValue: false)
  bool get isFavourite;
  @override
  @JsonKey(name: 'charts_count')
  int get count;
  @override
  @JsonKey(name: 'modified')
  String get time;
  @override
  @JsonKey(name: 'view_count')
  int get viewCount;

  /// Create a copy of DashboardMaster
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardMasterImplCopyWith<_$DashboardMasterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
