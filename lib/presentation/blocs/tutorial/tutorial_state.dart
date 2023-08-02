part of 'tutorial_bloc.dart';

@freezed
class TutorialState with _$TutorialState {
  const TutorialState._();
  Tutorial? get tutorial =>
      maybeMap(loaded: (state) => state.tutorial, orElse: () => null);
  const factory TutorialState.initial() = _Initial;
  const factory TutorialState.loading() = _Loading;
  const factory TutorialState.loaded({ Tutorial? tutorial}) = _Loaded;
  const factory TutorialState.error({required String error}) = _Error;
}
