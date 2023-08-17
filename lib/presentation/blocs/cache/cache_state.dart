part of 'cache_bloc.dart';

@freezed
class CacheState with _$CacheState {
  const CacheState._();
  List<QueryRecipe>? get
  queryRecipe => maybeMap(
      loaded: (state) => state.queryRecipe,
      orElse: () {
        return null;
      });
  const factory CacheState.initial() = _Initial;
  const factory CacheState.loading() = _Loading;
  const factory CacheState.loaded({required List<QueryRecipe> queryRecipe}) = _Loaded;
  const factory CacheState.saved() = _Saved;
}
