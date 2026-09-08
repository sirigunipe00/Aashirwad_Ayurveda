// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_entry_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewStockEntryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creating,
    required TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)
        ready,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creating,
    TResult? Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult? Function()? submitted,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creating,
    TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Ready value)? ready,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewStockEntryStateCopyWith<$Res> {
  factory $NewStockEntryStateCopyWith(
          NewStockEntryState value, $Res Function(NewStockEntryState) then) =
      _$NewStockEntryStateCopyWithImpl<$Res, NewStockEntryState>;
}

/// @nodoc
class _$NewStockEntryStateCopyWithImpl<$Res, $Val extends NewStockEntryState>
    implements $NewStockEntryStateCopyWith<$Res> {
  _$NewStockEntryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NewStockEntryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NewStockEntryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creating,
    required TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)
        ready,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creating,
    TResult? Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult? Function()? submitted,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creating,
    TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Ready value)? ready,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NewStockEntryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CreatingImplCopyWith<$Res> {
  factory _$$CreatingImplCopyWith(
          _$CreatingImpl value, $Res Function(_$CreatingImpl) then) =
      __$$CreatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatingImplCopyWithImpl<$Res>
    extends _$NewStockEntryStateCopyWithImpl<$Res, _$CreatingImpl>
    implements _$$CreatingImplCopyWith<$Res> {
  __$$CreatingImplCopyWithImpl(
      _$CreatingImpl _value, $Res Function(_$CreatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreatingImpl implements _Creating {
  const _$CreatingImpl();

  @override
  String toString() {
    return 'NewStockEntryState.creating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creating,
    required TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)
        ready,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return creating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creating,
    TResult? Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult? Function()? submitted,
    TResult? Function(String message)? error,
  }) {
    return creating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creating,
    TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return creating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_Error value)? error,
  }) {
    return creating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Ready value)? ready,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(this);
    }
    return orElse();
  }
}

abstract class _Creating implements NewStockEntryState {
  const factory _Creating() = _$CreatingImpl;
}

/// @nodoc
abstract class _$$ReadyImplCopyWith<$Res> {
  factory _$$ReadyImplCopyWith(
          _$ReadyImpl value, $Res Function(_$ReadyImpl) then) =
      __$$ReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? stockEntryName,
      StockEntry? stockEntry,
      List<StockItems> items,
      bool isScanning,
      bool isSubmitting,
      String? scanError});

  $StockEntryCopyWith<$Res>? get stockEntry;
}

/// @nodoc
class __$$ReadyImplCopyWithImpl<$Res>
    extends _$NewStockEntryStateCopyWithImpl<$Res, _$ReadyImpl>
    implements _$$ReadyImplCopyWith<$Res> {
  __$$ReadyImplCopyWithImpl(
      _$ReadyImpl _value, $Res Function(_$ReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockEntryName = freezed,
    Object? stockEntry = freezed,
    Object? items = null,
    Object? isScanning = null,
    Object? isSubmitting = null,
    Object? scanError = freezed,
  }) {
    return _then(_$ReadyImpl(
      stockEntryName: freezed == stockEntryName
          ? _value.stockEntryName
          : stockEntryName // ignore: cast_nullable_to_non_nullable
              as String?,
      stockEntry: freezed == stockEntry
          ? _value.stockEntry
          : stockEntry // ignore: cast_nullable_to_non_nullable
              as StockEntry?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<StockItems>,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      scanError: freezed == scanError
          ? _value.scanError
          : scanError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StockEntryCopyWith<$Res>? get stockEntry {
    if (_value.stockEntry == null) {
      return null;
    }

    return $StockEntryCopyWith<$Res>(_value.stockEntry!, (value) {
      return _then(_value.copyWith(stockEntry: value));
    });
  }
}

/// @nodoc

class _$ReadyImpl implements _Ready {
  const _$ReadyImpl(
      {this.stockEntryName,
      this.stockEntry,
      final List<StockItems> items = const [],
      this.isScanning = false,
      this.isSubmitting = false,
      this.scanError})
      : _items = items;

  @override
  final String? stockEntryName;
  @override
  final StockEntry? stockEntry;
  final List<StockItems> _items;
  @override
  @JsonKey()
  List<StockItems> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool isScanning;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? scanError;

  @override
  String toString() {
    return 'NewStockEntryState.ready(stockEntryName: $stockEntryName, stockEntry: $stockEntry, items: $items, isScanning: $isScanning, isSubmitting: $isSubmitting, scanError: $scanError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadyImpl &&
            (identical(other.stockEntryName, stockEntryName) ||
                other.stockEntryName == stockEntryName) &&
            (identical(other.stockEntry, stockEntry) ||
                other.stockEntry == stockEntry) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.scanError, scanError) ||
                other.scanError == scanError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stockEntryName,
      stockEntry,
      const DeepCollectionEquality().hash(_items),
      isScanning,
      isSubmitting,
      scanError);

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadyImplCopyWith<_$ReadyImpl> get copyWith =>
      __$$ReadyImplCopyWithImpl<_$ReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creating,
    required TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)
        ready,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return ready(
        stockEntryName, stockEntry, items, isScanning, isSubmitting, scanError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creating,
    TResult? Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult? Function()? submitted,
    TResult? Function(String message)? error,
  }) {
    return ready?.call(
        stockEntryName, stockEntry, items, isScanning, isSubmitting, scanError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creating,
    TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(stockEntryName, stockEntry, items, isScanning, isSubmitting,
          scanError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_Error value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Ready value)? ready,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _Ready implements NewStockEntryState {
  const factory _Ready(
      {final String? stockEntryName,
      final StockEntry? stockEntry,
      final List<StockItems> items,
      final bool isScanning,
      final bool isSubmitting,
      final String? scanError}) = _$ReadyImpl;

  String? get stockEntryName;
  StockEntry? get stockEntry;
  List<StockItems> get items;
  bool get isScanning;
  bool get isSubmitting;
  String? get scanError;

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadyImplCopyWith<_$ReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmittedImplCopyWith<$Res> {
  factory _$$SubmittedImplCopyWith(
          _$SubmittedImpl value, $Res Function(_$SubmittedImpl) then) =
      __$$SubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmittedImplCopyWithImpl<$Res>
    extends _$NewStockEntryStateCopyWithImpl<$Res, _$SubmittedImpl>
    implements _$$SubmittedImplCopyWith<$Res> {
  __$$SubmittedImplCopyWithImpl(
      _$SubmittedImpl _value, $Res Function(_$SubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmittedImpl implements _Submitted {
  const _$SubmittedImpl();

  @override
  String toString() {
    return 'NewStockEntryState.submitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creating,
    required TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)
        ready,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creating,
    TResult? Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult? Function()? submitted,
    TResult? Function(String message)? error,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creating,
    TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_Error value)? error,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Ready value)? ready,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements NewStockEntryState {
  const factory _Submitted() = _$SubmittedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$NewStockEntryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NewStockEntryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creating,
    required TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)
        ready,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creating,
    TResult? Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult? Function()? submitted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creating,
    TResult Function(
            String? stockEntryName,
            StockEntry? stockEntry,
            List<StockItems> items,
            bool isScanning,
            bool isSubmitting,
            String? scanError)?
        ready,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Submitted value)? submitted,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Ready value)? ready,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NewStockEntryState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of NewStockEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
