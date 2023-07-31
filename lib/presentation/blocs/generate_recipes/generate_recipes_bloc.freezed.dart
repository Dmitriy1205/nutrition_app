// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_recipes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenerateRecipesEvent {
  String get season => throw _privateConstructorUsedError;
  List<String> get cravings => throw _privateConstructorUsedError;
  List<String> get exclude => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String season, List<String> cravings, List<String> exclude)
        generateRecipes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String season, List<String> cravings, List<String> exclude)?
        generateRecipes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String season, List<String> cravings, List<String> exclude)?
        generateRecipes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateRecipes value) generateRecipes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateRecipes value)? generateRecipes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateRecipes value)? generateRecipes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenerateRecipesEventCopyWith<GenerateRecipesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateRecipesEventCopyWith<$Res> {
  factory $GenerateRecipesEventCopyWith(GenerateRecipesEvent value,
          $Res Function(GenerateRecipesEvent) then) =
      _$GenerateRecipesEventCopyWithImpl<$Res, GenerateRecipesEvent>;
  @useResult
  $Res call({String season, List<String> cravings, List<String> exclude});
}

/// @nodoc
class _$GenerateRecipesEventCopyWithImpl<$Res,
        $Val extends GenerateRecipesEvent>
    implements $GenerateRecipesEventCopyWith<$Res> {
  _$GenerateRecipesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? season = null,
    Object? cravings = null,
    Object? exclude = null,
  }) {
    return _then(_value.copyWith(
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      cravings: null == cravings
          ? _value.cravings
          : cravings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exclude: null == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenerateRecipesCopyWith<$Res>
    implements $GenerateRecipesEventCopyWith<$Res> {
  factory _$$_GenerateRecipesCopyWith(
          _$_GenerateRecipes value, $Res Function(_$_GenerateRecipes) then) =
      __$$_GenerateRecipesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String season, List<String> cravings, List<String> exclude});
}

/// @nodoc
class __$$_GenerateRecipesCopyWithImpl<$Res>
    extends _$GenerateRecipesEventCopyWithImpl<$Res, _$_GenerateRecipes>
    implements _$$_GenerateRecipesCopyWith<$Res> {
  __$$_GenerateRecipesCopyWithImpl(
      _$_GenerateRecipes _value, $Res Function(_$_GenerateRecipes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? season = null,
    Object? cravings = null,
    Object? exclude = null,
  }) {
    return _then(_$_GenerateRecipes(
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      cravings: null == cravings
          ? _value._cravings
          : cravings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exclude: null == exclude
          ? _value._exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_GenerateRecipes implements _GenerateRecipes {
  const _$_GenerateRecipes(
      {required this.season,
      required final List<String> cravings,
      required final List<String> exclude})
      : _cravings = cravings,
        _exclude = exclude;

  @override
  final String season;
  final List<String> _cravings;
  @override
  List<String> get cravings {
    if (_cravings is EqualUnmodifiableListView) return _cravings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cravings);
  }

  final List<String> _exclude;
  @override
  List<String> get exclude {
    if (_exclude is EqualUnmodifiableListView) return _exclude;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exclude);
  }

  @override
  String toString() {
    return 'GenerateRecipesEvent.generateRecipes(season: $season, cravings: $cravings, exclude: $exclude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenerateRecipes &&
            (identical(other.season, season) || other.season == season) &&
            const DeepCollectionEquality().equals(other._cravings, _cravings) &&
            const DeepCollectionEquality().equals(other._exclude, _exclude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      season,
      const DeepCollectionEquality().hash(_cravings),
      const DeepCollectionEquality().hash(_exclude));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenerateRecipesCopyWith<_$_GenerateRecipes> get copyWith =>
      __$$_GenerateRecipesCopyWithImpl<_$_GenerateRecipes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String season, List<String> cravings, List<String> exclude)
        generateRecipes,
  }) {
    return generateRecipes(season, cravings, exclude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String season, List<String> cravings, List<String> exclude)?
        generateRecipes,
  }) {
    return generateRecipes?.call(season, cravings, exclude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String season, List<String> cravings, List<String> exclude)?
        generateRecipes,
    required TResult orElse(),
  }) {
    if (generateRecipes != null) {
      return generateRecipes(season, cravings, exclude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenerateRecipes value) generateRecipes,
  }) {
    return generateRecipes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenerateRecipes value)? generateRecipes,
  }) {
    return generateRecipes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenerateRecipes value)? generateRecipes,
    required TResult orElse(),
  }) {
    if (generateRecipes != null) {
      return generateRecipes(this);
    }
    return orElse();
  }
}

abstract class _GenerateRecipes implements GenerateRecipesEvent {
  const factory _GenerateRecipes(
      {required final String season,
      required final List<String> cravings,
      required final List<String> exclude}) = _$_GenerateRecipes;

  @override
  String get season;
  @override
  List<String> get cravings;
  @override
  List<String> get exclude;
  @override
  @JsonKey(ignore: true)
  _$$_GenerateRecipesCopyWith<_$_GenerateRecipes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GenerateRecipesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generating,
    required TResult Function(List<String> recipes) generated,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(List<String> recipes)? generated,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(List<String> recipes)? generated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateRecipesStateCopyWith<$Res> {
  factory $GenerateRecipesStateCopyWith(GenerateRecipesState value,
          $Res Function(GenerateRecipesState) then) =
      _$GenerateRecipesStateCopyWithImpl<$Res, GenerateRecipesState>;
}

/// @nodoc
class _$GenerateRecipesStateCopyWithImpl<$Res,
        $Val extends GenerateRecipesState>
    implements $GenerateRecipesStateCopyWith<$Res> {
  _$GenerateRecipesStateCopyWithImpl(this._value, this._then);

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
    extends _$GenerateRecipesStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'GenerateRecipesState.initial()';
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
    required TResult Function() generating,
    required TResult Function(List<String> recipes) generated,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(List<String> recipes)? generated,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(List<String> recipes)? generated,
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
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends GenerateRecipesState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_GeneratingCopyWith<$Res> {
  factory _$$_GeneratingCopyWith(
          _$_Generating value, $Res Function(_$_Generating) then) =
      __$$_GeneratingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GeneratingCopyWithImpl<$Res>
    extends _$GenerateRecipesStateCopyWithImpl<$Res, _$_Generating>
    implements _$$_GeneratingCopyWith<$Res> {
  __$$_GeneratingCopyWithImpl(
      _$_Generating _value, $Res Function(_$_Generating) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Generating extends _Generating {
  const _$_Generating() : super._();

  @override
  String toString() {
    return 'GenerateRecipesState.generating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Generating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generating,
    required TResult Function(List<String> recipes) generated,
    required TResult Function(String error) error,
  }) {
    return generating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(List<String> recipes)? generated,
    TResult? Function(String error)? error,
  }) {
    return generating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(List<String> recipes)? generated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (generating != null) {
      return generating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_ErrorState value) error,
  }) {
    return generating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return generating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (generating != null) {
      return generating(this);
    }
    return orElse();
  }
}

abstract class _Generating extends GenerateRecipesState {
  const factory _Generating() = _$_Generating;
  const _Generating._() : super._();
}

/// @nodoc
abstract class _$$_GeneratedCopyWith<$Res> {
  factory _$$_GeneratedCopyWith(
          _$_Generated value, $Res Function(_$_Generated) then) =
      __$$_GeneratedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> recipes});
}

/// @nodoc
class __$$_GeneratedCopyWithImpl<$Res>
    extends _$GenerateRecipesStateCopyWithImpl<$Res, _$_Generated>
    implements _$$_GeneratedCopyWith<$Res> {
  __$$_GeneratedCopyWithImpl(
      _$_Generated _value, $Res Function(_$_Generated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_$_Generated(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Generated extends _Generated {
  const _$_Generated({required final List<String> recipes})
      : _recipes = recipes,
        super._();

  final List<String> _recipes;
  @override
  List<String> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'GenerateRecipesState.generated(recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Generated &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneratedCopyWith<_$_Generated> get copyWith =>
      __$$_GeneratedCopyWithImpl<_$_Generated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generating,
    required TResult Function(List<String> recipes) generated,
    required TResult Function(String error) error,
  }) {
    return generated(recipes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(List<String> recipes)? generated,
    TResult? Function(String error)? error,
  }) {
    return generated?.call(recipes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(List<String> recipes)? generated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (generated != null) {
      return generated(recipes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_ErrorState value) error,
  }) {
    return generated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return generated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (generated != null) {
      return generated(this);
    }
    return orElse();
  }
}

abstract class _Generated extends GenerateRecipesState {
  const factory _Generated({required final List<String> recipes}) =
      _$_Generated;
  const _Generated._() : super._();

  List<String> get recipes;
  @JsonKey(ignore: true)
  _$$_GeneratedCopyWith<_$_Generated> get copyWith =>
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
    extends _$GenerateRecipesStateCopyWithImpl<$Res, _$_ErrorState>
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
    return 'GenerateRecipesState.error(error: $error)';
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
    required TResult Function() generating,
    required TResult Function(List<String> recipes) generated,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(List<String> recipes)? generated,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(List<String> recipes)? generated,
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
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState extends GenerateRecipesState {
  const factory _ErrorState({required final String error}) = _$_ErrorState;
  const _ErrorState._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
