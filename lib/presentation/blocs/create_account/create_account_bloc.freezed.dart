// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateAccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? account) createFields,
    required TResult Function(String id) checkIfUserCreatedProfile,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? account)? createFields,
    TResult? Function(String id)? checkIfUserCreatedProfile,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? account)? createFields,
    TResult Function(String id)? checkIfUserCreatedProfile,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateFields value) createFields,
    required TResult Function(_CheckIfUserCreatedAccount value)
        checkIfUserCreatedProfile,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateFields value)? createFields,
    TResult? Function(_CheckIfUserCreatedAccount value)?
        checkIfUserCreatedProfile,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateFields value)? createFields,
    TResult Function(_CheckIfUserCreatedAccount value)?
        checkIfUserCreatedProfile,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAccountEventCopyWith<$Res> {
  factory $CreateAccountEventCopyWith(
          CreateAccountEvent value, $Res Function(CreateAccountEvent) then) =
      _$CreateAccountEventCopyWithImpl<$Res, CreateAccountEvent>;
}

/// @nodoc
class _$CreateAccountEventCopyWithImpl<$Res, $Val extends CreateAccountEvent>
    implements $CreateAccountEventCopyWith<$Res> {
  _$CreateAccountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CreateFieldsCopyWith<$Res> {
  factory _$$_CreateFieldsCopyWith(
          _$_CreateFields value, $Res Function(_$_CreateFields) then) =
      __$$_CreateFieldsCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic>? account});
}

/// @nodoc
class __$$_CreateFieldsCopyWithImpl<$Res>
    extends _$CreateAccountEventCopyWithImpl<$Res, _$_CreateFields>
    implements _$$_CreateFieldsCopyWith<$Res> {
  __$$_CreateFieldsCopyWithImpl(
      _$_CreateFields _value, $Res Function(_$_CreateFields) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_$_CreateFields(
      account: freezed == account
          ? _value._account
          : account // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$_CreateFields implements _CreateFields {
  const _$_CreateFields({required final Map<String, dynamic>? account})
      : _account = account;

  final Map<String, dynamic>? _account;
  @override
  Map<String, dynamic>? get account {
    final value = _account;
    if (value == null) return null;
    if (_account is EqualUnmodifiableMapView) return _account;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CreateAccountEvent.createFields(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateFields &&
            const DeepCollectionEquality().equals(other._account, _account));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_account));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateFieldsCopyWith<_$_CreateFields> get copyWith =>
      __$$_CreateFieldsCopyWithImpl<_$_CreateFields>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? account) createFields,
    required TResult Function(String id) checkIfUserCreatedProfile,
    required TResult Function() reset,
  }) {
    return createFields(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? account)? createFields,
    TResult? Function(String id)? checkIfUserCreatedProfile,
    TResult? Function()? reset,
  }) {
    return createFields?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? account)? createFields,
    TResult Function(String id)? checkIfUserCreatedProfile,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (createFields != null) {
      return createFields(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateFields value) createFields,
    required TResult Function(_CheckIfUserCreatedAccount value)
        checkIfUserCreatedProfile,
    required TResult Function(_Reset value) reset,
  }) {
    return createFields(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateFields value)? createFields,
    TResult? Function(_CheckIfUserCreatedAccount value)?
        checkIfUserCreatedProfile,
    TResult? Function(_Reset value)? reset,
  }) {
    return createFields?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateFields value)? createFields,
    TResult Function(_CheckIfUserCreatedAccount value)?
        checkIfUserCreatedProfile,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (createFields != null) {
      return createFields(this);
    }
    return orElse();
  }
}

abstract class _CreateFields implements CreateAccountEvent {
  const factory _CreateFields({required final Map<String, dynamic>? account}) =
      _$_CreateFields;

  Map<String, dynamic>? get account;
  @JsonKey(ignore: true)
  _$$_CreateFieldsCopyWith<_$_CreateFields> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckIfUserCreatedAccountCopyWith<$Res> {
  factory _$$_CheckIfUserCreatedAccountCopyWith(
          _$_CheckIfUserCreatedAccount value,
          $Res Function(_$_CheckIfUserCreatedAccount) then) =
      __$$_CheckIfUserCreatedAccountCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_CheckIfUserCreatedAccountCopyWithImpl<$Res>
    extends _$CreateAccountEventCopyWithImpl<$Res, _$_CheckIfUserCreatedAccount>
    implements _$$_CheckIfUserCreatedAccountCopyWith<$Res> {
  __$$_CheckIfUserCreatedAccountCopyWithImpl(
      _$_CheckIfUserCreatedAccount _value,
      $Res Function(_$_CheckIfUserCreatedAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_CheckIfUserCreatedAccount(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CheckIfUserCreatedAccount implements _CheckIfUserCreatedAccount {
  const _$_CheckIfUserCreatedAccount({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'CreateAccountEvent.checkIfUserCreatedProfile(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckIfUserCreatedAccount &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckIfUserCreatedAccountCopyWith<_$_CheckIfUserCreatedAccount>
      get copyWith => __$$_CheckIfUserCreatedAccountCopyWithImpl<
          _$_CheckIfUserCreatedAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? account) createFields,
    required TResult Function(String id) checkIfUserCreatedProfile,
    required TResult Function() reset,
  }) {
    return checkIfUserCreatedProfile(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? account)? createFields,
    TResult? Function(String id)? checkIfUserCreatedProfile,
    TResult? Function()? reset,
  }) {
    return checkIfUserCreatedProfile?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? account)? createFields,
    TResult Function(String id)? checkIfUserCreatedProfile,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (checkIfUserCreatedProfile != null) {
      return checkIfUserCreatedProfile(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateFields value) createFields,
    required TResult Function(_CheckIfUserCreatedAccount value)
        checkIfUserCreatedProfile,
    required TResult Function(_Reset value) reset,
  }) {
    return checkIfUserCreatedProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateFields value)? createFields,
    TResult? Function(_CheckIfUserCreatedAccount value)?
        checkIfUserCreatedProfile,
    TResult? Function(_Reset value)? reset,
  }) {
    return checkIfUserCreatedProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateFields value)? createFields,
    TResult Function(_CheckIfUserCreatedAccount value)?
        checkIfUserCreatedProfile,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (checkIfUserCreatedProfile != null) {
      return checkIfUserCreatedProfile(this);
    }
    return orElse();
  }
}

abstract class _CheckIfUserCreatedAccount implements CreateAccountEvent {
  const factory _CheckIfUserCreatedAccount({required final String id}) =
      _$_CheckIfUserCreatedAccount;

  String get id;
  @JsonKey(ignore: true)
  _$$_CheckIfUserCreatedAccountCopyWith<_$_CheckIfUserCreatedAccount>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetCopyWith<$Res> {
  factory _$$_ResetCopyWith(_$_Reset value, $Res Function(_$_Reset) then) =
      __$$_ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetCopyWithImpl<$Res>
    extends _$CreateAccountEventCopyWithImpl<$Res, _$_Reset>
    implements _$$_ResetCopyWith<$Res> {
  __$$_ResetCopyWithImpl(_$_Reset _value, $Res Function(_$_Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Reset implements _Reset {
  const _$_Reset();

  @override
  String toString() {
    return 'CreateAccountEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? account) createFields,
    required TResult Function(String id) checkIfUserCreatedProfile,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? account)? createFields,
    TResult? Function(String id)? checkIfUserCreatedProfile,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? account)? createFields,
    TResult Function(String id)? checkIfUserCreatedProfile,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateFields value) createFields,
    required TResult Function(_CheckIfUserCreatedAccount value)
        checkIfUserCreatedProfile,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateFields value)? createFields,
    TResult? Function(_CheckIfUserCreatedAccount value)?
        checkIfUserCreatedProfile,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateFields value)? createFields,
    TResult Function(_CheckIfUserCreatedAccount value)?
        checkIfUserCreatedProfile,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements CreateAccountEvent {
  const factory _Reset() = _$_Reset;
}

/// @nodoc
mixin _$CreateAccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileNotCreated,
    required TResult Function() success,
    required TResult Function() created,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileNotCreated,
    TResult? Function()? success,
    TResult? Function()? created,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileNotCreated,
    TResult Function()? success,
    TResult Function()? created,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ProfileNotCreated value) profileNotCreated,
    required TResult Function(_Success value) success,
    required TResult Function(_Created value) created,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ProfileNotCreated value)? profileNotCreated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Created value)? created,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ProfileNotCreated value)? profileNotCreated,
    TResult Function(_Success value)? success,
    TResult Function(_Created value)? created,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAccountStateCopyWith<$Res> {
  factory $CreateAccountStateCopyWith(
          CreateAccountState value, $Res Function(CreateAccountState) then) =
      _$CreateAccountStateCopyWithImpl<$Res, CreateAccountState>;
}

/// @nodoc
class _$CreateAccountStateCopyWithImpl<$Res, $Val extends CreateAccountState>
    implements $CreateAccountStateCopyWith<$Res> {
  _$CreateAccountStateCopyWithImpl(this._value, this._then);

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
    extends _$CreateAccountStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CreateAccountState.initial()';
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
    required TResult Function() profileNotCreated,
    required TResult Function() success,
    required TResult Function() created,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileNotCreated,
    TResult? Function()? success,
    TResult? Function()? created,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileNotCreated,
    TResult Function()? success,
    TResult Function()? created,
    TResult Function()? loading,
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
    required TResult Function(_ProfileNotCreated value) profileNotCreated,
    required TResult Function(_Success value) success,
    required TResult Function(_Created value) created,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ProfileNotCreated value)? profileNotCreated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Created value)? created,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ProfileNotCreated value)? profileNotCreated,
    TResult Function(_Success value)? success,
    TResult Function(_Created value)? created,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CreateAccountState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_ProfileNotCreatedCopyWith<$Res> {
  factory _$$_ProfileNotCreatedCopyWith(_$_ProfileNotCreated value,
          $Res Function(_$_ProfileNotCreated) then) =
      __$$_ProfileNotCreatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProfileNotCreatedCopyWithImpl<$Res>
    extends _$CreateAccountStateCopyWithImpl<$Res, _$_ProfileNotCreated>
    implements _$$_ProfileNotCreatedCopyWith<$Res> {
  __$$_ProfileNotCreatedCopyWithImpl(
      _$_ProfileNotCreated _value, $Res Function(_$_ProfileNotCreated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ProfileNotCreated implements _ProfileNotCreated {
  const _$_ProfileNotCreated();

  @override
  String toString() {
    return 'CreateAccountState.profileNotCreated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ProfileNotCreated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileNotCreated,
    required TResult Function() success,
    required TResult Function() created,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return profileNotCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileNotCreated,
    TResult? Function()? success,
    TResult? Function()? created,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return profileNotCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileNotCreated,
    TResult Function()? success,
    TResult Function()? created,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (profileNotCreated != null) {
      return profileNotCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ProfileNotCreated value) profileNotCreated,
    required TResult Function(_Success value) success,
    required TResult Function(_Created value) created,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return profileNotCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ProfileNotCreated value)? profileNotCreated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Created value)? created,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return profileNotCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ProfileNotCreated value)? profileNotCreated,
    TResult Function(_Success value)? success,
    TResult Function(_Created value)? created,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (profileNotCreated != null) {
      return profileNotCreated(this);
    }
    return orElse();
  }
}

abstract class _ProfileNotCreated implements CreateAccountState {
  const factory _ProfileNotCreated() = _$_ProfileNotCreated;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$CreateAccountStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success();

  @override
  String toString() {
    return 'CreateAccountState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileNotCreated,
    required TResult Function() success,
    required TResult Function() created,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileNotCreated,
    TResult? Function()? success,
    TResult? Function()? created,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileNotCreated,
    TResult Function()? success,
    TResult Function()? created,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ProfileNotCreated value) profileNotCreated,
    required TResult Function(_Success value) success,
    required TResult Function(_Created value) created,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ProfileNotCreated value)? profileNotCreated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Created value)? created,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ProfileNotCreated value)? profileNotCreated,
    TResult Function(_Success value)? success,
    TResult Function(_Created value)? created,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CreateAccountState {
  const factory _Success() = _$_Success;
}

/// @nodoc
abstract class _$$_CreatedCopyWith<$Res> {
  factory _$$_CreatedCopyWith(
          _$_Created value, $Res Function(_$_Created) then) =
      __$$_CreatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreatedCopyWithImpl<$Res>
    extends _$CreateAccountStateCopyWithImpl<$Res, _$_Created>
    implements _$$_CreatedCopyWith<$Res> {
  __$$_CreatedCopyWithImpl(_$_Created _value, $Res Function(_$_Created) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Created implements _Created {
  const _$_Created();

  @override
  String toString() {
    return 'CreateAccountState.created()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Created);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileNotCreated,
    required TResult Function() success,
    required TResult Function() created,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return created();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileNotCreated,
    TResult? Function()? success,
    TResult? Function()? created,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return created?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileNotCreated,
    TResult Function()? success,
    TResult Function()? created,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ProfileNotCreated value) profileNotCreated,
    required TResult Function(_Success value) success,
    required TResult Function(_Created value) created,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ProfileNotCreated value)? profileNotCreated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Created value)? created,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ProfileNotCreated value)? profileNotCreated,
    TResult Function(_Success value)? success,
    TResult Function(_Created value)? created,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class _Created implements CreateAccountState {
  const factory _Created() = _$_Created;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CreateAccountStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'CreateAccountState.loading()';
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
    required TResult Function() profileNotCreated,
    required TResult Function() success,
    required TResult Function() created,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileNotCreated,
    TResult? Function()? success,
    TResult? Function()? created,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileNotCreated,
    TResult Function()? success,
    TResult Function()? created,
    TResult Function()? loading,
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
    required TResult Function(_ProfileNotCreated value) profileNotCreated,
    required TResult Function(_Success value) success,
    required TResult Function(_Created value) created,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ProfileNotCreated value)? profileNotCreated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Created value)? created,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ProfileNotCreated value)? profileNotCreated,
    TResult Function(_Success value)? success,
    TResult Function(_Created value)? created,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CreateAccountState {
  const factory _Loading() = _$_Loading;
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
    extends _$CreateAccountStateCopyWithImpl<$Res, _$_Error>
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

class _$_Error implements _Error {
  const _$_Error({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CreateAccountState.error(error: $error)';
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
    required TResult Function() profileNotCreated,
    required TResult Function() success,
    required TResult Function() created,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileNotCreated,
    TResult? Function()? success,
    TResult? Function()? created,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileNotCreated,
    TResult Function()? success,
    TResult Function()? created,
    TResult Function()? loading,
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
    required TResult Function(_ProfileNotCreated value) profileNotCreated,
    required TResult Function(_Success value) success,
    required TResult Function(_Created value) created,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ProfileNotCreated value)? profileNotCreated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Created value)? created,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ProfileNotCreated value)? profileNotCreated,
    TResult Function(_Success value)? success,
    TResult Function(_Created value)? created,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CreateAccountState {
  const factory _Error({required final String error}) = _$_Error;

  String get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
