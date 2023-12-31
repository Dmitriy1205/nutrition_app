// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TutorialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createTutorial,
    required TResult Function(Map<String, dynamic> data) updateTutorial,
    required TResult Function() getTutorial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createTutorial,
    TResult? Function(Map<String, dynamic> data)? updateTutorial,
    TResult? Function()? getTutorial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createTutorial,
    TResult Function(Map<String, dynamic> data)? updateTutorial,
    TResult Function()? getTutorial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateTutorial value) createTutorial,
    required TResult Function(_UpdateTutorial value) updateTutorial,
    required TResult Function(_GetTutorial value) getTutorial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateTutorial value)? createTutorial,
    TResult? Function(_UpdateTutorial value)? updateTutorial,
    TResult? Function(_GetTutorial value)? getTutorial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateTutorial value)? createTutorial,
    TResult Function(_UpdateTutorial value)? updateTutorial,
    TResult Function(_GetTutorial value)? getTutorial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialEventCopyWith<$Res> {
  factory $TutorialEventCopyWith(
          TutorialEvent value, $Res Function(TutorialEvent) then) =
      _$TutorialEventCopyWithImpl<$Res, TutorialEvent>;
}

/// @nodoc
class _$TutorialEventCopyWithImpl<$Res, $Val extends TutorialEvent>
    implements $TutorialEventCopyWith<$Res> {
  _$TutorialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CreateTutorialCopyWith<$Res> {
  factory _$$_CreateTutorialCopyWith(
          _$_CreateTutorial value, $Res Function(_$_CreateTutorial) then) =
      __$$_CreateTutorialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreateTutorialCopyWithImpl<$Res>
    extends _$TutorialEventCopyWithImpl<$Res, _$_CreateTutorial>
    implements _$$_CreateTutorialCopyWith<$Res> {
  __$$_CreateTutorialCopyWithImpl(
      _$_CreateTutorial _value, $Res Function(_$_CreateTutorial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CreateTutorial implements _CreateTutorial {
  const _$_CreateTutorial();

  @override
  String toString() {
    return 'TutorialEvent.createTutorial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CreateTutorial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createTutorial,
    required TResult Function(Map<String, dynamic> data) updateTutorial,
    required TResult Function() getTutorial,
  }) {
    return createTutorial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createTutorial,
    TResult? Function(Map<String, dynamic> data)? updateTutorial,
    TResult? Function()? getTutorial,
  }) {
    return createTutorial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createTutorial,
    TResult Function(Map<String, dynamic> data)? updateTutorial,
    TResult Function()? getTutorial,
    required TResult orElse(),
  }) {
    if (createTutorial != null) {
      return createTutorial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateTutorial value) createTutorial,
    required TResult Function(_UpdateTutorial value) updateTutorial,
    required TResult Function(_GetTutorial value) getTutorial,
  }) {
    return createTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateTutorial value)? createTutorial,
    TResult? Function(_UpdateTutorial value)? updateTutorial,
    TResult? Function(_GetTutorial value)? getTutorial,
  }) {
    return createTutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateTutorial value)? createTutorial,
    TResult Function(_UpdateTutorial value)? updateTutorial,
    TResult Function(_GetTutorial value)? getTutorial,
    required TResult orElse(),
  }) {
    if (createTutorial != null) {
      return createTutorial(this);
    }
    return orElse();
  }
}

abstract class _CreateTutorial implements TutorialEvent {
  const factory _CreateTutorial() = _$_CreateTutorial;
}

/// @nodoc
abstract class _$$_UpdateTutorialCopyWith<$Res> {
  factory _$$_UpdateTutorialCopyWith(
          _$_UpdateTutorial value, $Res Function(_$_UpdateTutorial) then) =
      __$$_UpdateTutorialCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$_UpdateTutorialCopyWithImpl<$Res>
    extends _$TutorialEventCopyWithImpl<$Res, _$_UpdateTutorial>
    implements _$$_UpdateTutorialCopyWith<$Res> {
  __$$_UpdateTutorialCopyWithImpl(
      _$_UpdateTutorial _value, $Res Function(_$_UpdateTutorial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_UpdateTutorial(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_UpdateTutorial implements _UpdateTutorial {
  const _$_UpdateTutorial({required final Map<String, dynamic> data})
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'TutorialEvent.updateTutorial(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateTutorial &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateTutorialCopyWith<_$_UpdateTutorial> get copyWith =>
      __$$_UpdateTutorialCopyWithImpl<_$_UpdateTutorial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createTutorial,
    required TResult Function(Map<String, dynamic> data) updateTutorial,
    required TResult Function() getTutorial,
  }) {
    return updateTutorial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createTutorial,
    TResult? Function(Map<String, dynamic> data)? updateTutorial,
    TResult? Function()? getTutorial,
  }) {
    return updateTutorial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createTutorial,
    TResult Function(Map<String, dynamic> data)? updateTutorial,
    TResult Function()? getTutorial,
    required TResult orElse(),
  }) {
    if (updateTutorial != null) {
      return updateTutorial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateTutorial value) createTutorial,
    required TResult Function(_UpdateTutorial value) updateTutorial,
    required TResult Function(_GetTutorial value) getTutorial,
  }) {
    return updateTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateTutorial value)? createTutorial,
    TResult? Function(_UpdateTutorial value)? updateTutorial,
    TResult? Function(_GetTutorial value)? getTutorial,
  }) {
    return updateTutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateTutorial value)? createTutorial,
    TResult Function(_UpdateTutorial value)? updateTutorial,
    TResult Function(_GetTutorial value)? getTutorial,
    required TResult orElse(),
  }) {
    if (updateTutorial != null) {
      return updateTutorial(this);
    }
    return orElse();
  }
}

abstract class _UpdateTutorial implements TutorialEvent {
  const factory _UpdateTutorial({required final Map<String, dynamic> data}) =
      _$_UpdateTutorial;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$_UpdateTutorialCopyWith<_$_UpdateTutorial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetTutorialCopyWith<$Res> {
  factory _$$_GetTutorialCopyWith(
          _$_GetTutorial value, $Res Function(_$_GetTutorial) then) =
      __$$_GetTutorialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetTutorialCopyWithImpl<$Res>
    extends _$TutorialEventCopyWithImpl<$Res, _$_GetTutorial>
    implements _$$_GetTutorialCopyWith<$Res> {
  __$$_GetTutorialCopyWithImpl(
      _$_GetTutorial _value, $Res Function(_$_GetTutorial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetTutorial implements _GetTutorial {
  const _$_GetTutorial();

  @override
  String toString() {
    return 'TutorialEvent.getTutorial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetTutorial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createTutorial,
    required TResult Function(Map<String, dynamic> data) updateTutorial,
    required TResult Function() getTutorial,
  }) {
    return getTutorial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createTutorial,
    TResult? Function(Map<String, dynamic> data)? updateTutorial,
    TResult? Function()? getTutorial,
  }) {
    return getTutorial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createTutorial,
    TResult Function(Map<String, dynamic> data)? updateTutorial,
    TResult Function()? getTutorial,
    required TResult orElse(),
  }) {
    if (getTutorial != null) {
      return getTutorial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateTutorial value) createTutorial,
    required TResult Function(_UpdateTutorial value) updateTutorial,
    required TResult Function(_GetTutorial value) getTutorial,
  }) {
    return getTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateTutorial value)? createTutorial,
    TResult? Function(_UpdateTutorial value)? updateTutorial,
    TResult? Function(_GetTutorial value)? getTutorial,
  }) {
    return getTutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateTutorial value)? createTutorial,
    TResult Function(_UpdateTutorial value)? updateTutorial,
    TResult Function(_GetTutorial value)? getTutorial,
    required TResult orElse(),
  }) {
    if (getTutorial != null) {
      return getTutorial(this);
    }
    return orElse();
  }
}

abstract class _GetTutorial implements TutorialEvent {
  const factory _GetTutorial() = _$_GetTutorial;
}

/// @nodoc
mixin _$TutorialState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Tutorial? tutorial) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Tutorial? tutorial)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Tutorial? tutorial)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialStateCopyWith<$Res> {
  factory $TutorialStateCopyWith(
          TutorialState value, $Res Function(TutorialState) then) =
      _$TutorialStateCopyWithImpl<$Res, TutorialState>;
}

/// @nodoc
class _$TutorialStateCopyWithImpl<$Res, $Val extends TutorialState>
    implements $TutorialStateCopyWith<$Res> {
  _$TutorialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TutorialStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'TutorialState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Tutorial? tutorial) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Tutorial? tutorial)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Tutorial? tutorial)? loaded,
    TResult Function(String error)? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends TutorialState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$TutorialStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'TutorialState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Tutorial? tutorial) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Tutorial? tutorial)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Tutorial? tutorial)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends TutorialState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Tutorial? tutorial});

  $TutorialCopyWith<$Res>? get tutorial;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$TutorialStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tutorial = freezed,
  }) {
    return _then(_$_Loaded(
      tutorial: freezed == tutorial
          ? _value.tutorial
          : tutorial // ignore: cast_nullable_to_non_nullable
              as Tutorial?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TutorialCopyWith<$Res>? get tutorial {
    if (_value.tutorial == null) {
      return null;
    }

    return $TutorialCopyWith<$Res>(_value.tutorial!, (value) {
      return _then(_value.copyWith(tutorial: value));
    });
  }
}

/// @nodoc

class _$_Loaded extends _Loaded {
  const _$_Loaded({this.tutorial}) : super._();

  @override
  final Tutorial? tutorial;

  @override
  String toString() {
    return 'TutorialState.loaded(tutorial: $tutorial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.tutorial, tutorial) ||
                other.tutorial == tutorial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tutorial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Tutorial? tutorial) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(tutorial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Tutorial? tutorial)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(tutorial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Tutorial? tutorial)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tutorial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends TutorialState {
  const factory _Loaded({final Tutorial? tutorial}) = _$_Loaded;
  const _Loaded._() : super._();

  Tutorial? get tutorial;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$TutorialStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Error(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error extends _Error {
  const _$_Error({required this.error}) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'TutorialState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Tutorial? tutorial) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Tutorial? tutorial)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Tutorial? tutorial)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends TutorialState {
  const factory _Error({required final String error}) = _$_Error;
  const _Error._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
