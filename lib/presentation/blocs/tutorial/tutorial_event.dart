part of 'tutorial_bloc.dart';

@freezed
class TutorialEvent with _$TutorialEvent {
  const factory TutorialEvent.createTutorial() = _CreateTutorial;
  const factory TutorialEvent.updateTutorial({required Map<String,dynamic> data}) = _UpdateTutorial;
  const factory TutorialEvent.getTutorial() = _GetTutorial;
}
