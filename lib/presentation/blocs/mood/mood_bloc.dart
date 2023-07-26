import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutrition_app/data/models/recipe/recipe.dart';

part 'mood_event.dart';

part 'mood_state.dart';

part 'mood_bloc.freezed.dart';

class MoodBloc extends Bloc<MoodEvent, MoodState> {
  MoodBloc() : super(const MoodState.initial()) {
    on<MoodEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
      MoodEvent event, Emitter<MoodState> emit) async {
    event.map(
      setData: (e) => _setData(e, emit),
    );
  }

  Future<void> _setData(_SetData event, Emitter<MoodState> emit) async {
    emit(
      MoodState.loaded(
        recipe: const Recipe().copyWith(
            mood: event.data.containsKey(RecipeFields.mood)
                ? event.data[RecipeFields.mood]
                : '',
            product: event.data.containsKey(RecipeFields.product)
                ? event.data[RecipeFields.product]
                : []),
      ),
    );
  }
}
