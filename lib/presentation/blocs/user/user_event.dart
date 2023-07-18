part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.fetchData({required String userId}) = _FetchData;

  const factory UserEvent.reset() = _Reset;
}
