part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.fetchData({required String userId}) = _FetchData;
  const factory ProfileEvent.updateData({required UserAccount? account}) = _UpdateData;

  const factory ProfileEvent.reset() = _Reset;
}
