import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/local/share_pref.dart';
import '../../../data/models/query_recipe/query_recipe.dart';

part 'cache_event.dart';

part 'cache_state.dart';

part 'cache_bloc.freezed.dart';

class CacheBloc extends Bloc<CacheEvent, CacheState> {
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  CacheBloc() : super(const CacheState.initial()) {
    on<CacheEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
      CacheEvent event, Emitter<CacheState> emit) async {
    await event.map(
      read: (e) => _read(e, emit),
      write: (e) => _write(e, emit),
    );
  }

  Future<void> _read(_ReadEvent event, Emitter<CacheState> emit) async {
    emit(const CacheState.loading());
    List<QueryRecipe> queryRecipe =
        await sharedPreferencesHelper.readQueryRecipes();
    emit(CacheState.loaded(queryRecipe: queryRecipe));
  }

  Future<void> _write(_WriteEvent event, Emitter<CacheState> emit) async {
    await sharedPreferencesHelper.writeQueryRecipe(
        name: event.name, image: event.image, recipeBody: event.recipeBody);
    emit(const CacheState.saved());
  }
}
