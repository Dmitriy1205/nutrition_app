// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeEvent {
  String get recipeName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phase, String mood, List<String> exclude, String recipeName)
        generateRecipe,
    required TResult Function(String recipeName) generateImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phase, String mood, List<String> exclude, String recipeName)?
        generateRecipe,
    TResult? Function(String recipeName)? generateImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phase, String mood, List<String> exclude, String recipeName)?
        generateRecipe,
    TResult Function(String recipeName)? generateImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateRecipe value) generateRecipe,
    required TResult Function(_GenerateImage value) generateImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateRecipe value)? generateRecipe,
    TResult? Function(_GenerateImage value)? generateImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateRecipe value)? generateRecipe,
    TResult Function(_GenerateImage value)? generateImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeEventCopyWith<RecipeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeEventCopyWith<$Res> {
  factory $RecipeEventCopyWith(
          RecipeEvent value, $Res Function(RecipeEvent) then) =
      _$RecipeEventCopyWithImpl<$Res, RecipeEvent>;
  @useResult
  $Res call({String recipeName});
}

/// @nodoc
class _$RecipeEventCopyWithImpl<$Res, $Val extends RecipeEvent>
    implements $RecipeEventCopyWith<$Res> {
  _$RecipeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeName = null,
  }) {
    return _then(_value.copyWith(
      recipeName: null == recipeName
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenerateRecipeCopyWith<$Res>
    implements $RecipeEventCopyWith<$Res> {
  factory _$$_GenerateRecipeCopyWith(
          _$_GenerateRecipe value, $Res Function(_$_GenerateRecipe) then) =
      __$$_GenerateRecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phase, String mood, List<String> exclude, String recipeName});
}

/// @nodoc
class __$$_GenerateRecipeCopyWithImpl<$Res>
    extends _$RecipeEventCopyWithImpl<$Res, _$_GenerateRecipe>
    implements _$$_GenerateRecipeCopyWith<$Res> {
  __$$_GenerateRecipeCopyWithImpl(
      _$_GenerateRecipe _value, $Res Function(_$_GenerateRecipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? mood = null,
    Object? exclude = null,
    Object? recipeName = null,
  }) {
    return _then(_$_GenerateRecipe(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as String,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String,
      exclude: null == exclude
          ? _value._exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recipeName: null == recipeName
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GenerateRecipe implements _GenerateRecipe {
  const _$_GenerateRecipe(
      {required this.phase,
      required this.mood,
      required final List<String> exclude,
      required this.recipeName})
      : _exclude = exclude;

  @override
  final String phase;
  @override
  final String mood;
  final List<String> _exclude;
  @override
  List<String> get exclude {
    if (_exclude is EqualUnmodifiableListView) return _exclude;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exclude);
  }

  @override
  final String recipeName;

  @override
  String toString() {
    return 'RecipeEvent.generateRecipe(phase: $phase, mood: $mood, exclude: $exclude, recipeName: $recipeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenerateRecipe &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            const DeepCollectionEquality().equals(other._exclude, _exclude) &&
            (identical(other.recipeName, recipeName) ||
                other.recipeName == recipeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phase, mood,
      const DeepCollectionEquality().hash(_exclude), recipeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenerateRecipeCopyWith<_$_GenerateRecipe> get copyWith =>
      __$$_GenerateRecipeCopyWithImpl<_$_GenerateRecipe>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phase, String mood, List<String> exclude, String recipeName)
        generateRecipe,
    required TResult Function(String recipeName) generateImage,
  }) {
    return generateRecipe(phase, mood, exclude, recipeName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phase, String mood, List<String> exclude, String recipeName)?
        generateRecipe,
    TResult? Function(String recipeName)? generateImage,
  }) {
    return generateRecipe?.call(phase, mood, exclude, recipeName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phase, String mood, List<String> exclude, String recipeName)?
        generateRecipe,
    TResult Function(String recipeName)? generateImage,
    required TResult orElse(),
  }) {
    if (generateRecipe != null) {
      return generateRecipe(phase, mood, exclude, recipeName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateRecipe value) generateRecipe,
    required TResult Function(_GenerateImage value) generateImage,
  }) {
    return generateRecipe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateRecipe value)? generateRecipe,
    TResult? Function(_GenerateImage value)? generateImage,
  }) {
    return generateRecipe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateRecipe value)? generateRecipe,
    TResult Function(_GenerateImage value)? generateImage,
    required TResult orElse(),
  }) {
    if (generateRecipe != null) {
      return generateRecipe(this);
    }
    return orElse();
  }
}

abstract class _GenerateRecipe implements RecipeEvent {
  const factory _GenerateRecipe(
      {required final String phase,
      required final String mood,
      required final List<String> exclude,
      required final String recipeName}) = _$_GenerateRecipe;

  String get phase;
  String get mood;
  List<String> get exclude;
  @override
  String get recipeName;
  @override
  @JsonKey(ignore: true)
  _$$_GenerateRecipeCopyWith<_$_GenerateRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GenerateImageCopyWith<$Res>
    implements $RecipeEventCopyWith<$Res> {
  factory _$$_GenerateImageCopyWith(
          _$_GenerateImage value, $Res Function(_$_GenerateImage) then) =
      __$$_GenerateImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String recipeName});
}

/// @nodoc
class __$$_GenerateImageCopyWithImpl<$Res>
    extends _$RecipeEventCopyWithImpl<$Res, _$_GenerateImage>
    implements _$$_GenerateImageCopyWith<$Res> {
  __$$_GenerateImageCopyWithImpl(
      _$_GenerateImage _value, $Res Function(_$_GenerateImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeName = null,
  }) {
    return _then(_$_GenerateImage(
      recipeName: null == recipeName
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GenerateImage implements _GenerateImage {
  const _$_GenerateImage({required this.recipeName});

  @override
  final String recipeName;

  @override
  String toString() {
    return 'RecipeEvent.generateImage(recipeName: $recipeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenerateImage &&
            (identical(other.recipeName, recipeName) ||
                other.recipeName == recipeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenerateImageCopyWith<_$_GenerateImage> get copyWith =>
      __$$_GenerateImageCopyWithImpl<_$_GenerateImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String phase, String mood, List<String> exclude, String recipeName)
        generateRecipe,
    required TResult Function(String recipeName) generateImage,
  }) {
    return generateImage(recipeName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String phase, String mood, List<String> exclude, String recipeName)?
        generateRecipe,
    TResult? Function(String recipeName)? generateImage,
  }) {
    return generateImage?.call(recipeName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String phase, String mood, List<String> exclude, String recipeName)?
        generateRecipe,
    TResult Function(String recipeName)? generateImage,
    required TResult orElse(),
  }) {
    if (generateImage != null) {
      return generateImage(recipeName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateRecipe value) generateRecipe,
    required TResult Function(_GenerateImage value) generateImage,
  }) {
    return generateImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateRecipe value)? generateRecipe,
    TResult? Function(_GenerateImage value)? generateImage,
  }) {
    return generateImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateRecipe value)? generateRecipe,
    TResult Function(_GenerateImage value)? generateImage,
    required TResult orElse(),
  }) {
    if (generateImage != null) {
      return generateImage(this);
    }
    return orElse();
  }
}

abstract class _GenerateImage implements RecipeEvent {
  const factory _GenerateImage({required final String recipeName}) =
      _$_GenerateImage;

  @override
  String get recipeName;
  @override
  @JsonKey(ignore: true)
  _$$_GenerateImageCopyWith<_$_GenerateImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecipeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() textGenerating,
    required TResult Function() imageGenerating,
    required TResult Function(String recipeText) textGenerated,
    required TResult Function(String recipeImage) imageGenerated,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? textGenerating,
    TResult? Function()? imageGenerating,
    TResult? Function(String recipeText)? textGenerated,
    TResult? Function(String recipeImage)? imageGenerated,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? textGenerating,
    TResult Function()? imageGenerating,
    TResult Function(String recipeText)? textGenerated,
    TResult Function(String recipeImage)? imageGenerated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_TextGenerating value) textGenerating,
    required TResult Function(_ImageGenerating value) imageGenerating,
    required TResult Function(_TextGenerated value) textGenerated,
    required TResult Function(_ImageGenerated value) imageGenerated,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TextGenerating value)? textGenerating,
    TResult? Function(_ImageGenerating value)? imageGenerating,
    TResult? Function(_TextGenerated value)? textGenerated,
    TResult? Function(_ImageGenerated value)? imageGenerated,
    TResult? Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TextGenerating value)? textGenerating,
    TResult Function(_ImageGenerating value)? imageGenerating,
    TResult Function(_TextGenerated value)? textGenerated,
    TResult Function(_ImageGenerated value)? imageGenerated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStateCopyWith<$Res> {
  factory $RecipeStateCopyWith(
          RecipeState value, $Res Function(RecipeState) then) =
      _$RecipeStateCopyWithImpl<$Res, RecipeState>;
}

/// @nodoc
class _$RecipeStateCopyWithImpl<$Res, $Val extends RecipeState>
    implements $RecipeStateCopyWith<$Res> {
  _$RecipeStateCopyWithImpl(this._value, this._then);

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
    extends _$RecipeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'RecipeState.initial()';
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
    required TResult Function() textGenerating,
    required TResult Function() imageGenerating,
    required TResult Function(String recipeText) textGenerated,
    required TResult Function(String recipeImage) imageGenerated,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? textGenerating,
    TResult? Function()? imageGenerating,
    TResult? Function(String recipeText)? textGenerated,
    TResult? Function(String recipeImage)? imageGenerated,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? textGenerating,
    TResult Function()? imageGenerating,
    TResult Function(String recipeText)? textGenerated,
    TResult Function(String recipeImage)? imageGenerated,
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
    required TResult Function(_TextGenerating value) textGenerating,
    required TResult Function(_ImageGenerating value) imageGenerating,
    required TResult Function(_TextGenerated value) textGenerated,
    required TResult Function(_ImageGenerated value) imageGenerated,
    required TResult Function(_ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TextGenerating value)? textGenerating,
    TResult? Function(_ImageGenerating value)? imageGenerating,
    TResult? Function(_TextGenerated value)? textGenerated,
    TResult? Function(_ImageGenerated value)? imageGenerated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TextGenerating value)? textGenerating,
    TResult Function(_ImageGenerating value)? imageGenerating,
    TResult Function(_TextGenerated value)? textGenerated,
    TResult Function(_ImageGenerated value)? imageGenerated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends RecipeState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_TextGeneratingCopyWith<$Res> {
  factory _$$_TextGeneratingCopyWith(
          _$_TextGenerating value, $Res Function(_$_TextGenerating) then) =
      __$$_TextGeneratingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TextGeneratingCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$_TextGenerating>
    implements _$$_TextGeneratingCopyWith<$Res> {
  __$$_TextGeneratingCopyWithImpl(
      _$_TextGenerating _value, $Res Function(_$_TextGenerating) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TextGenerating extends _TextGenerating {
  const _$_TextGenerating() : super._();

  @override
  String toString() {
    return 'RecipeState.textGenerating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TextGenerating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() textGenerating,
    required TResult Function() imageGenerating,
    required TResult Function(String recipeText) textGenerated,
    required TResult Function(String recipeImage) imageGenerated,
    required TResult Function(String error) error,
  }) {
    return textGenerating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? textGenerating,
    TResult? Function()? imageGenerating,
    TResult? Function(String recipeText)? textGenerated,
    TResult? Function(String recipeImage)? imageGenerated,
    TResult? Function(String error)? error,
  }) {
    return textGenerating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? textGenerating,
    TResult Function()? imageGenerating,
    TResult Function(String recipeText)? textGenerated,
    TResult Function(String recipeImage)? imageGenerated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (textGenerating != null) {
      return textGenerating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_TextGenerating value) textGenerating,
    required TResult Function(_ImageGenerating value) imageGenerating,
    required TResult Function(_TextGenerated value) textGenerated,
    required TResult Function(_ImageGenerated value) imageGenerated,
    required TResult Function(_ErrorState value) error,
  }) {
    return textGenerating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TextGenerating value)? textGenerating,
    TResult? Function(_ImageGenerating value)? imageGenerating,
    TResult? Function(_TextGenerated value)? textGenerated,
    TResult? Function(_ImageGenerated value)? imageGenerated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return textGenerating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TextGenerating value)? textGenerating,
    TResult Function(_ImageGenerating value)? imageGenerating,
    TResult Function(_TextGenerated value)? textGenerated,
    TResult Function(_ImageGenerated value)? imageGenerated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (textGenerating != null) {
      return textGenerating(this);
    }
    return orElse();
  }
}

abstract class _TextGenerating extends RecipeState {
  const factory _TextGenerating() = _$_TextGenerating;
  const _TextGenerating._() : super._();
}

/// @nodoc
abstract class _$$_ImageGeneratingCopyWith<$Res> {
  factory _$$_ImageGeneratingCopyWith(
          _$_ImageGenerating value, $Res Function(_$_ImageGenerating) then) =
      __$$_ImageGeneratingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ImageGeneratingCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$_ImageGenerating>
    implements _$$_ImageGeneratingCopyWith<$Res> {
  __$$_ImageGeneratingCopyWithImpl(
      _$_ImageGenerating _value, $Res Function(_$_ImageGenerating) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ImageGenerating extends _ImageGenerating {
  const _$_ImageGenerating() : super._();

  @override
  String toString() {
    return 'RecipeState.imageGenerating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ImageGenerating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() textGenerating,
    required TResult Function() imageGenerating,
    required TResult Function(String recipeText) textGenerated,
    required TResult Function(String recipeImage) imageGenerated,
    required TResult Function(String error) error,
  }) {
    return imageGenerating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? textGenerating,
    TResult? Function()? imageGenerating,
    TResult? Function(String recipeText)? textGenerated,
    TResult? Function(String recipeImage)? imageGenerated,
    TResult? Function(String error)? error,
  }) {
    return imageGenerating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? textGenerating,
    TResult Function()? imageGenerating,
    TResult Function(String recipeText)? textGenerated,
    TResult Function(String recipeImage)? imageGenerated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (imageGenerating != null) {
      return imageGenerating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_TextGenerating value) textGenerating,
    required TResult Function(_ImageGenerating value) imageGenerating,
    required TResult Function(_TextGenerated value) textGenerated,
    required TResult Function(_ImageGenerated value) imageGenerated,
    required TResult Function(_ErrorState value) error,
  }) {
    return imageGenerating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TextGenerating value)? textGenerating,
    TResult? Function(_ImageGenerating value)? imageGenerating,
    TResult? Function(_TextGenerated value)? textGenerated,
    TResult? Function(_ImageGenerated value)? imageGenerated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return imageGenerating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TextGenerating value)? textGenerating,
    TResult Function(_ImageGenerating value)? imageGenerating,
    TResult Function(_TextGenerated value)? textGenerated,
    TResult Function(_ImageGenerated value)? imageGenerated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (imageGenerating != null) {
      return imageGenerating(this);
    }
    return orElse();
  }
}

abstract class _ImageGenerating extends RecipeState {
  const factory _ImageGenerating() = _$_ImageGenerating;
  const _ImageGenerating._() : super._();
}

/// @nodoc
abstract class _$$_TextGeneratedCopyWith<$Res> {
  factory _$$_TextGeneratedCopyWith(
          _$_TextGenerated value, $Res Function(_$_TextGenerated) then) =
      __$$_TextGeneratedCopyWithImpl<$Res>;
  @useResult
  $Res call({String recipeText});
}

/// @nodoc
class __$$_TextGeneratedCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$_TextGenerated>
    implements _$$_TextGeneratedCopyWith<$Res> {
  __$$_TextGeneratedCopyWithImpl(
      _$_TextGenerated _value, $Res Function(_$_TextGenerated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeText = null,
  }) {
    return _then(_$_TextGenerated(
      recipeText: null == recipeText
          ? _value.recipeText
          : recipeText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TextGenerated extends _TextGenerated {
  const _$_TextGenerated({required this.recipeText}) : super._();

  @override
  final String recipeText;

  @override
  String toString() {
    return 'RecipeState.textGenerated(recipeText: $recipeText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextGenerated &&
            (identical(other.recipeText, recipeText) ||
                other.recipeText == recipeText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipeText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextGeneratedCopyWith<_$_TextGenerated> get copyWith =>
      __$$_TextGeneratedCopyWithImpl<_$_TextGenerated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() textGenerating,
    required TResult Function() imageGenerating,
    required TResult Function(String recipeText) textGenerated,
    required TResult Function(String recipeImage) imageGenerated,
    required TResult Function(String error) error,
  }) {
    return textGenerated(recipeText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? textGenerating,
    TResult? Function()? imageGenerating,
    TResult? Function(String recipeText)? textGenerated,
    TResult? Function(String recipeImage)? imageGenerated,
    TResult? Function(String error)? error,
  }) {
    return textGenerated?.call(recipeText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? textGenerating,
    TResult Function()? imageGenerating,
    TResult Function(String recipeText)? textGenerated,
    TResult Function(String recipeImage)? imageGenerated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (textGenerated != null) {
      return textGenerated(recipeText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_TextGenerating value) textGenerating,
    required TResult Function(_ImageGenerating value) imageGenerating,
    required TResult Function(_TextGenerated value) textGenerated,
    required TResult Function(_ImageGenerated value) imageGenerated,
    required TResult Function(_ErrorState value) error,
  }) {
    return textGenerated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TextGenerating value)? textGenerating,
    TResult? Function(_ImageGenerating value)? imageGenerating,
    TResult? Function(_TextGenerated value)? textGenerated,
    TResult? Function(_ImageGenerated value)? imageGenerated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return textGenerated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TextGenerating value)? textGenerating,
    TResult Function(_ImageGenerating value)? imageGenerating,
    TResult Function(_TextGenerated value)? textGenerated,
    TResult Function(_ImageGenerated value)? imageGenerated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (textGenerated != null) {
      return textGenerated(this);
    }
    return orElse();
  }
}

abstract class _TextGenerated extends RecipeState {
  const factory _TextGenerated({required final String recipeText}) =
      _$_TextGenerated;
  const _TextGenerated._() : super._();

  String get recipeText;
  @JsonKey(ignore: true)
  _$$_TextGeneratedCopyWith<_$_TextGenerated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImageGeneratedCopyWith<$Res> {
  factory _$$_ImageGeneratedCopyWith(
          _$_ImageGenerated value, $Res Function(_$_ImageGenerated) then) =
      __$$_ImageGeneratedCopyWithImpl<$Res>;
  @useResult
  $Res call({String recipeImage});
}

/// @nodoc
class __$$_ImageGeneratedCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res, _$_ImageGenerated>
    implements _$$_ImageGeneratedCopyWith<$Res> {
  __$$_ImageGeneratedCopyWithImpl(
      _$_ImageGenerated _value, $Res Function(_$_ImageGenerated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeImage = null,
  }) {
    return _then(_$_ImageGenerated(
      recipeImage: null == recipeImage
          ? _value.recipeImage
          : recipeImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ImageGenerated extends _ImageGenerated {
  const _$_ImageGenerated({required this.recipeImage}) : super._();

  @override
  final String recipeImage;

  @override
  String toString() {
    return 'RecipeState.imageGenerated(recipeImage: $recipeImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageGenerated &&
            (identical(other.recipeImage, recipeImage) ||
                other.recipeImage == recipeImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipeImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageGeneratedCopyWith<_$_ImageGenerated> get copyWith =>
      __$$_ImageGeneratedCopyWithImpl<_$_ImageGenerated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() textGenerating,
    required TResult Function() imageGenerating,
    required TResult Function(String recipeText) textGenerated,
    required TResult Function(String recipeImage) imageGenerated,
    required TResult Function(String error) error,
  }) {
    return imageGenerated(recipeImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? textGenerating,
    TResult? Function()? imageGenerating,
    TResult? Function(String recipeText)? textGenerated,
    TResult? Function(String recipeImage)? imageGenerated,
    TResult? Function(String error)? error,
  }) {
    return imageGenerated?.call(recipeImage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? textGenerating,
    TResult Function()? imageGenerating,
    TResult Function(String recipeText)? textGenerated,
    TResult Function(String recipeImage)? imageGenerated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (imageGenerated != null) {
      return imageGenerated(recipeImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_TextGenerating value) textGenerating,
    required TResult Function(_ImageGenerating value) imageGenerating,
    required TResult Function(_TextGenerated value) textGenerated,
    required TResult Function(_ImageGenerated value) imageGenerated,
    required TResult Function(_ErrorState value) error,
  }) {
    return imageGenerated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TextGenerating value)? textGenerating,
    TResult? Function(_ImageGenerating value)? imageGenerating,
    TResult? Function(_TextGenerated value)? textGenerated,
    TResult? Function(_ImageGenerated value)? imageGenerated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return imageGenerated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TextGenerating value)? textGenerating,
    TResult Function(_ImageGenerating value)? imageGenerating,
    TResult Function(_TextGenerated value)? textGenerated,
    TResult Function(_ImageGenerated value)? imageGenerated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (imageGenerated != null) {
      return imageGenerated(this);
    }
    return orElse();
  }
}

abstract class _ImageGenerated extends RecipeState {
  const factory _ImageGenerated({required final String recipeImage}) =
      _$_ImageGenerated;
  const _ImageGenerated._() : super._();

  String get recipeImage;
  @JsonKey(ignore: true)
  _$$_ImageGeneratedCopyWith<_$_ImageGenerated> get copyWith =>
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
    extends _$RecipeStateCopyWithImpl<$Res, _$_ErrorState>
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
    return 'RecipeState.error(error: $error)';
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
    required TResult Function() textGenerating,
    required TResult Function() imageGenerating,
    required TResult Function(String recipeText) textGenerated,
    required TResult Function(String recipeImage) imageGenerated,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? textGenerating,
    TResult? Function()? imageGenerating,
    TResult? Function(String recipeText)? textGenerated,
    TResult? Function(String recipeImage)? imageGenerated,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? textGenerating,
    TResult Function()? imageGenerating,
    TResult Function(String recipeText)? textGenerated,
    TResult Function(String recipeImage)? imageGenerated,
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
    required TResult Function(_TextGenerating value) textGenerating,
    required TResult Function(_ImageGenerating value) imageGenerating,
    required TResult Function(_TextGenerated value) textGenerated,
    required TResult Function(_ImageGenerated value) imageGenerated,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TextGenerating value)? textGenerating,
    TResult? Function(_ImageGenerating value)? imageGenerating,
    TResult? Function(_TextGenerated value)? textGenerated,
    TResult? Function(_ImageGenerated value)? imageGenerated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TextGenerating value)? textGenerating,
    TResult Function(_ImageGenerating value)? imageGenerating,
    TResult Function(_TextGenerated value)? textGenerated,
    TResult Function(_ImageGenerated value)? imageGenerated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState extends RecipeState {
  const factory _ErrorState({required final String error}) = _$_ErrorState;
  const _ErrorState._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
