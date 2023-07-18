part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const UserState._();
  UserAccount? get
  user => maybeMap(
      initialized: (state) => state.user,
      orElse: () {
        return null;
      });

  const factory UserState.initial() = _Initial;

  const factory UserState.loading() = _LoadingState;

  const factory UserState.initialized({required UserAccount user}) =
  _Initialize;

  const factory UserState.error({required String error}) = _ErrorState;
}
