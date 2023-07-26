part of 'mood_bloc.dart';

@freezed
class MoodEvent with _$MoodEvent {
  const factory MoodEvent.setData({required Map<String, dynamic> data}) = _SetData;
}
