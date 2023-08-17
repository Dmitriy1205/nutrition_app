// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_recipe_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedRecipeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String recipeName, String recipeText, String recipeImage)
        saveRecipe,
    required TResult Function(String recipeId) deleteRecipe,
    required TResult Function() getRecipes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String recipeName, String recipeText, String recipeImage)?
        saveRecipe,
    TResult? Function(String recipeId)? deleteRecipe,
    TResult? Function()? getRecipes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recipeName, String recipeText, String recipeImage)?
        saveRecipe,
    TResult Function(String recipeId)? deleteRecipe,
    TResult Function()? getRecipes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveRecipe value) saveRecipe,
    required TResult Function(_DeleteRecipe value) deleteRecipe,
    required TResult Function(_GetRecipes value) getRecipes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveRecipe value)? saveRecipe,
    TResult? Function(_DeleteRecipe value)? deleteRecipe,
    TResult? Function(_GetRecipes value)? getRecipes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveRecipe value)? saveRecipe,
    TResult Function(_DeleteRecipe value)? deleteRecipe,
    TResult Function(_GetRecipes value)? getRecipes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedRecipeEventCopyWith<$Res> {
  factory $SavedRecipeEventCopyWith(
          SavedRecipeEvent value, $Res Function(SavedRecipeEvent) then) =
      _$SavedRecipeEventCopyWithImpl<$Res, SavedRecipeEvent>;
}

/// @nodoc
class _$SavedRecipeEventCopyWithImpl<$Res, $Val extends SavedRecipeEvent>
    implements $SavedRecipeEventCopyWith<$Res> {
  _$SavedRecipeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SaveRecipeCopyWith<$Res> {
  factory _$$_SaveRecipeCopyWith(
          _$_SaveRecipe value, $Res Function(_$_SaveRecipe) then) =
      __$$_SaveRecipeCopyWithImpl<$Res>;
  @useResult
  $Res call({String recipeName, String recipeText, String recipeImage});
}

/// @nodoc
class __$$_SaveRecipeCopyWithImpl<$Res>
    extends _$SavedRecipeEventCopyWithImpl<$Res, _$_SaveRecipe>
    implements _$$_SaveRecipeCopyWith<$Res> {
  __$$_SaveRecipeCopyWithImpl(
      _$_SaveRecipe _value, $Res Function(_$_SaveRecipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeName = null,
    Object? recipeText = null,
    Object? recipeImage = null,
  }) {
    return _then(_$_SaveRecipe(
      recipeName: null == recipeName
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String,
      recipeText: null == recipeText
          ? _value.recipeText
          : recipeText // ignore: cast_nullable_to_non_nullable
              as String,
      recipeImage: null == recipeImage
          ? _value.recipeImage
          : recipeImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SaveRecipe implements _SaveRecipe {
  const _$_SaveRecipe(
      {required this.recipeName,
      required this.recipeText,
      required this.recipeImage});

  @override
  final String recipeName;
  @override
  final String recipeText;
  @override
  final String recipeImage;

  @override
  String toString() {
    return 'SavedRecipeEvent.saveRecipe(recipeName: $recipeName, recipeText: $recipeText, recipeImage: $recipeImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveRecipe &&
            (identical(other.recipeName, recipeName) ||
                other.recipeName == recipeName) &&
            (identical(other.recipeText, recipeText) ||
                other.recipeText == recipeText) &&
            (identical(other.recipeImage, recipeImage) ||
                other.recipeImage == recipeImage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, recipeName, recipeText, recipeImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveRecipeCopyWith<_$_SaveRecipe> get copyWith =>
      __$$_SaveRecipeCopyWithImpl<_$_SaveRecipe>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String recipeName, String recipeText, String recipeImage)
        saveRecipe,
    required TResult Function(String recipeId) deleteRecipe,
    required TResult Function() getRecipes,
  }) {
    return saveRecipe(recipeName, recipeText, recipeImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String recipeName, String recipeText, String recipeImage)?
        saveRecipe,
    TResult? Function(String recipeId)? deleteRecipe,
    TResult? Function()? getRecipes,
  }) {
    return saveRecipe?.call(recipeName, recipeText, recipeImage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recipeName, String recipeText, String recipeImage)?
        saveRecipe,
    TResult Function(String recipeId)? deleteRecipe,
    TResult Function()? getRecipes,
    required TResult orElse(),
  }) {
    if (saveRecipe != null) {
      return saveRecipe(recipeName, recipeText, recipeImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveRecipe value) saveRecipe,
    required TResult Function(_DeleteRecipe value) deleteRecipe,
    required TResult Function(_GetRecipes value) getRecipes,
  }) {
    return saveRecipe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveRecipe value)? saveRecipe,
    TResult? Function(_DeleteRecipe value)? deleteRecipe,
    TResult? Function(_GetRecipes value)? getRecipes,
  }) {
    return saveRecipe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveRecipe value)? saveRecipe,
    TResult Function(_DeleteRecipe value)? deleteRecipe,
    TResult Function(_GetRecipes value)? getRecipes,
    required TResult orElse(),
  }) {
    if (saveRecipe != null) {
      return saveRecipe(this);
    }
    return orElse();
  }
}

abstract class _SaveRecipe implements SavedRecipeEvent {
  const factory _SaveRecipe(
      {required final String recipeName,
      required final String recipeText,
      required final String recipeImage}) = _$_SaveRecipe;

  String get recipeName;
  String get recipeText;
  String get recipeImage;
  @JsonKey(ignore: true)
  _$$_SaveRecipeCopyWith<_$_SaveRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteRecipeCopyWith<$Res> {
  factory _$$_DeleteRecipeCopyWith(
          _$_DeleteRecipe value, $Res Function(_$_DeleteRecipe) then) =
      __$$_DeleteRecipeCopyWithImpl<$Res>;
  @useResult
  $Res call({String recipeId});
}

/// @nodoc
class __$$_DeleteRecipeCopyWithImpl<$Res>
    extends _$SavedRecipeEventCopyWithImpl<$Res, _$_DeleteRecipe>
    implements _$$_DeleteRecipeCopyWith<$Res> {
  __$$_DeleteRecipeCopyWithImpl(
      _$_DeleteRecipe _value, $Res Function(_$_DeleteRecipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
  }) {
    return _then(_$_DeleteRecipe(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteRecipe implements _DeleteRecipe {
  const _$_DeleteRecipe({required this.recipeId});

  @override
  final String recipeId;

  @override
  String toString() {
    return 'SavedRecipeEvent.deleteRecipe(recipeId: $recipeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteRecipe &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteRecipeCopyWith<_$_DeleteRecipe> get copyWith =>
      __$$_DeleteRecipeCopyWithImpl<_$_DeleteRecipe>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String recipeName, String recipeText, String recipeImage)
        saveRecipe,
    required TResult Function(String recipeId) deleteRecipe,
    required TResult Function() getRecipes,
  }) {
    return deleteRecipe(recipeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String recipeName, String recipeText, String recipeImage)?
        saveRecipe,
    TResult? Function(String recipeId)? deleteRecipe,
    TResult? Function()? getRecipes,
  }) {
    return deleteRecipe?.call(recipeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recipeName, String recipeText, String recipeImage)?
        saveRecipe,
    TResult Function(String recipeId)? deleteRecipe,
    TResult Function()? getRecipes,
    required TResult orElse(),
  }) {
    if (deleteRecipe != null) {
      return deleteRecipe(recipeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveRecipe value) saveRecipe,
    required TResult Function(_DeleteRecipe value) deleteRecipe,
    required TResult Function(_GetRecipes value) getRecipes,
  }) {
    return deleteRecipe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveRecipe value)? saveRecipe,
    TResult? Function(_DeleteRecipe value)? deleteRecipe,
    TResult? Function(_GetRecipes value)? getRecipes,
  }) {
    return deleteRecipe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveRecipe value)? saveRecipe,
    TResult Function(_DeleteRecipe value)? deleteRecipe,
    TResult Function(_GetRecipes value)? getRecipes,
    required TResult orElse(),
  }) {
    if (deleteRecipe != null) {
      return deleteRecipe(this);
    }
    return orElse();
  }
}

abstract class _DeleteRecipe implements SavedRecipeEvent {
  const factory _DeleteRecipe({required final String recipeId}) =
      _$_DeleteRecipe;

  String get recipeId;
  @JsonKey(ignore: true)
  _$$_DeleteRecipeCopyWith<_$_DeleteRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetRecipesCopyWith<$Res> {
  factory _$$_GetRecipesCopyWith(
          _$_GetRecipes value, $Res Function(_$_GetRecipes) then) =
      __$$_GetRecipesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetRecipesCopyWithImpl<$Res>
    extends _$SavedRecipeEventCopyWithImpl<$Res, _$_GetRecipes>
    implements _$$_GetRecipesCopyWith<$Res> {
  __$$_GetRecipesCopyWithImpl(
      _$_GetRecipes _value, $Res Function(_$_GetRecipes) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetRecipes implements _GetRecipes {
  const _$_GetRecipes();

  @override
  String toString() {
    return 'SavedRecipeEvent.getRecipes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetRecipes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String recipeName, String recipeText, String recipeImage)
        saveRecipe,
    required TResult Function(String recipeId) deleteRecipe,
    required TResult Function() getRecipes,
  }) {
    return getRecipes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String recipeName, String recipeText, String recipeImage)?
        saveRecipe,
    TResult? Function(String recipeId)? deleteRecipe,
    TResult? Function()? getRecipes,
  }) {
    return getRecipes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recipeName, String recipeText, String recipeImage)?
        saveRecipe,
    TResult Function(String recipeId)? deleteRecipe,
    TResult Function()? getRecipes,
    required TResult orElse(),
  }) {
    if (getRecipes != null) {
      return getRecipes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveRecipe value) saveRecipe,
    required TResult Function(_DeleteRecipe value) deleteRecipe,
    required TResult Function(_GetRecipes value) getRecipes,
  }) {
    return getRecipes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveRecipe value)? saveRecipe,
    TResult? Function(_DeleteRecipe value)? deleteRecipe,
    TResult? Function(_GetRecipes value)? getRecipes,
  }) {
    return getRecipes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveRecipe value)? saveRecipe,
    TResult Function(_DeleteRecipe value)? deleteRecipe,
    TResult Function(_GetRecipes value)? getRecipes,
    required TResult orElse(),
  }) {
    if (getRecipes != null) {
      return getRecipes(this);
    }
    return orElse();
  }
}

abstract class _GetRecipes implements SavedRecipeEvent {
  const factory _GetRecipes() = _$_GetRecipes;
}

/// @nodoc
mixin _$SavedRecipeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() saved,
    required TResult Function(List<SavedRecipe> recipes) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function()? saved,
    TResult? Function(List<SavedRecipe> recipes)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? saved,
    TResult Function(List<SavedRecipe> recipes)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Success value) success,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Success value)? success,
    TResult? Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Saved value)? saved,
    TResult Function(_Success value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedRecipeStateCopyWith<$Res> {
  factory $SavedRecipeStateCopyWith(
          SavedRecipeState value, $Res Function(SavedRecipeState) then) =
      _$SavedRecipeStateCopyWithImpl<$Res, SavedRecipeState>;
}

/// @nodoc
class _$SavedRecipeStateCopyWithImpl<$Res, $Val extends SavedRecipeState>
    implements $SavedRecipeStateCopyWith<$Res> {
  _$SavedRecipeStateCopyWithImpl(this._value, this._then);

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
    extends _$SavedRecipeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'SavedRecipeState.initial()';
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
    required TResult Function() saving,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() saved,
    required TResult Function(List<SavedRecipe> recipes) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function()? saved,
    TResult? Function(List<SavedRecipe> recipes)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? saved,
    TResult Function(List<SavedRecipe> recipes)? success,
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
    required TResult Function(_Saving value) saving,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Success value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Success value)? success,
    TResult? Function(_ErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Saved value)? saved,
    TResult Function(_Success value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends SavedRecipeState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_SavingCopyWith<$Res> {
  factory _$$_SavingCopyWith(_$_Saving value, $Res Function(_$_Saving) then) =
      __$$_SavingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SavingCopyWithImpl<$Res>
    extends _$SavedRecipeStateCopyWithImpl<$Res, _$_Saving>
    implements _$$_SavingCopyWith<$Res> {
  __$$_SavingCopyWithImpl(_$_Saving _value, $Res Function(_$_Saving) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Saving extends _Saving {
  const _$_Saving() : super._();

  @override
  String toString() {
    return 'SavedRecipeState.saving()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Saving);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() saved,
    required TResult Function(List<SavedRecipe> recipes) success,
    required TResult Function(String error) error,
  }) {
    return saving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function()? saved,
    TResult? Function(List<SavedRecipe> recipes)? success,
    TResult? Function(String error)? error,
  }) {
    return saving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? saved,
    TResult Function(List<SavedRecipe> recipes)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Success value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Success value)? success,
    TResult? Function(_ErrorState value)? error,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Saved value)? saved,
    TResult Function(_Success value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving extends SavedRecipeState {
  const factory _Saving() = _$_Saving;
  const _Saving._() : super._();
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$SavedRecipeStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'SavedRecipeState.loading()';
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
    required TResult Function() saving,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() saved,
    required TResult Function(List<SavedRecipe> recipes) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function()? saved,
    TResult? Function(List<SavedRecipe> recipes)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? saved,
    TResult Function(List<SavedRecipe> recipes)? success,
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
    required TResult Function(_Saving value) saving,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Success value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Success value)? success,
    TResult? Function(_ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Saved value)? saved,
    TResult Function(_Success value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends SavedRecipeState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_DeletedCopyWith<$Res> {
  factory _$$_DeletedCopyWith(
          _$_Deleted value, $Res Function(_$_Deleted) then) =
      __$$_DeletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeletedCopyWithImpl<$Res>
    extends _$SavedRecipeStateCopyWithImpl<$Res, _$_Deleted>
    implements _$$_DeletedCopyWith<$Res> {
  __$$_DeletedCopyWithImpl(_$_Deleted _value, $Res Function(_$_Deleted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Deleted extends _Deleted {
  const _$_Deleted() : super._();

  @override
  String toString() {
    return 'SavedRecipeState.deleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Deleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() saved,
    required TResult Function(List<SavedRecipe> recipes) success,
    required TResult Function(String error) error,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function()? saved,
    TResult? Function(List<SavedRecipe> recipes)? success,
    TResult? Function(String error)? error,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? saved,
    TResult Function(List<SavedRecipe> recipes)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Success value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Success value)? success,
    TResult? Function(_ErrorState value)? error,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Saved value)? saved,
    TResult Function(_Success value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted extends SavedRecipeState {
  const factory _Deleted() = _$_Deleted;
  const _Deleted._() : super._();
}

/// @nodoc
abstract class _$$_SavedCopyWith<$Res> {
  factory _$$_SavedCopyWith(_$_Saved value, $Res Function(_$_Saved) then) =
      __$$_SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SavedCopyWithImpl<$Res>
    extends _$SavedRecipeStateCopyWithImpl<$Res, _$_Saved>
    implements _$$_SavedCopyWith<$Res> {
  __$$_SavedCopyWithImpl(_$_Saved _value, $Res Function(_$_Saved) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Saved extends _Saved {
  const _$_Saved() : super._();

  @override
  String toString() {
    return 'SavedRecipeState.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() saved,
    required TResult Function(List<SavedRecipe> recipes) success,
    required TResult Function(String error) error,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function()? saved,
    TResult? Function(List<SavedRecipe> recipes)? success,
    TResult? Function(String error)? error,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? saved,
    TResult Function(List<SavedRecipe> recipes)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Success value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Success value)? success,
    TResult? Function(_ErrorState value)? error,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Saved value)? saved,
    TResult Function(_Success value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved extends SavedRecipeState {
  const factory _Saved() = _$_Saved;
  const _Saved._() : super._();
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SavedRecipe> recipes});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$SavedRecipeStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_$_Success(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<SavedRecipe>,
    ));
  }
}

/// @nodoc

class _$_Success extends _Success {
  const _$_Success({required final List<SavedRecipe> recipes})
      : _recipes = recipes,
        super._();

  final List<SavedRecipe> _recipes;
  @override
  List<SavedRecipe> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'SavedRecipeState.success(recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() saved,
    required TResult Function(List<SavedRecipe> recipes) success,
    required TResult Function(String error) error,
  }) {
    return success(recipes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function()? saved,
    TResult? Function(List<SavedRecipe> recipes)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(recipes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? saved,
    TResult Function(List<SavedRecipe> recipes)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(recipes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Success value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Success value)? success,
    TResult? Function(_ErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Saved value)? saved,
    TResult Function(_Success value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends SavedRecipeState {
  const factory _Success({required final List<SavedRecipe> recipes}) =
      _$_Success;
  const _Success._() : super._();

  List<SavedRecipe> get recipes;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorStateCopyWith<$Res> {
  factory _$$_ErrorStateCopyWith(
          _$_ErrorState value, $Res Function(_$_ErrorState) then) =
      __$$_ErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_ErrorStateCopyWithImpl<$Res>
    extends _$SavedRecipeStateCopyWithImpl<$Res, _$_ErrorState>
    implements _$$_ErrorStateCopyWith<$Res> {
  __$$_ErrorStateCopyWithImpl(
      _$_ErrorState _value, $Res Function(_$_ErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_ErrorState(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorState extends _ErrorState {
  const _$_ErrorState({required this.error}) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'SavedRecipeState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      __$$_ErrorStateCopyWithImpl<_$_ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() saved,
    required TResult Function(List<SavedRecipe> recipes) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function()? saved,
    TResult? Function(List<SavedRecipe> recipes)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? saved,
    TResult Function(List<SavedRecipe> recipes)? success,
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
    required TResult Function(_Saving value) saving,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Success value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Success value)? success,
    TResult? Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Saved value)? saved,
    TResult Function(_Success value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState extends SavedRecipeState {
  const factory _ErrorState({required final String error}) = _$_ErrorState;
  const _ErrorState._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
