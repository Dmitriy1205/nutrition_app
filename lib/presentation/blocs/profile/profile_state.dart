part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();
  UserAccount? get
  user => maybeMap(
      initialized: (state) => state.user,
      orElse: () {
        return null;
      });

  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _LoadingState;

  const factory ProfileState.initialized({required UserAccount user}) =
  _Initialize;
  const factory ProfileState.success() = _Success;
  const factory ProfileState.error({required String error}) = _ErrorState;
}
