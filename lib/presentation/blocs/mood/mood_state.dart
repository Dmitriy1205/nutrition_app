part of 'mood_bloc.dart';

@freezed
class MoodState with _$MoodState {
  const MoodState._();

  Recipe? get recipe => maybeMap(
      loaded: (state) => state.recipe,
      orElse: () {
        return null;
      });

  const factory MoodState.initial() = _Initial;

  const factory MoodState.loaded({required Recipe recipe}) = _Loaded;
}
