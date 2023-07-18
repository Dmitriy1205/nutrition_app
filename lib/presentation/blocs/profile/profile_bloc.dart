import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/exceptions.dart';
import '../../../data/models/account/account.dart';
import '../../../data/repositories/user_repository.dart';
import '../auth/auth_bloc.dart';
import '../create_account/create_account_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;
  final AuthBloc _authBloc;
  final CreateAccountBloc _createAccountBloc;

  late StreamSubscription _createAccountSubscription;
  late StreamSubscription _authSubscription;

  ProfileBloc(
      {required UserRepository userRepository,
      required AuthBloc authBloc,
      required CreateAccountBloc createAccountBloc})
      : _userRepository = userRepository,
        _authBloc = authBloc,
        _createAccountBloc = createAccountBloc,
        super(const ProfileState.initial()) {
    on<ProfileEvent>(_mapBlocToState);
    _createAccountSubscription = _createAccountBloc.stream.listen((event) {
      event.maybeMap(
          success: (state) =>
              add(ProfileEvent.fetchData(userId: authBloc.state.user!.uid)),
          orElse: () {});
    });
    _authSubscription = authBloc.stream.listen((state) {
      state.maybeMap(
          unauthenticated: (_) {
            add(const ProfileEvent.reset());
          },
          orElse: () {});
    });
  }

  Future<void> _mapBlocToState(
      ProfileEvent event, Emitter<ProfileState> emit) async {
    await event.map(
      fetchData: (e) => _fetchData(e, emit),
      reset: (e) => _reset(e, emit),
      updateData: (e) => _updateData(e, emit),
    );
  }

  Future<void> _fetchData(_FetchData event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      final currentUser = _authBloc.state.user!.uid;
      final user = await _userRepository.getAccount(id: currentUser);

      emit(ProfileState.initialized(user: user));
    } on BadRequestException catch (e) {
      emit(ProfileState.error(error: e.message));
    }
  }

  Future<void> _updateData(
      _UpdateData event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      final currentUser = _authBloc.state.user!.uid;
      await _userRepository.updateAccount(
          userId: currentUser, data: event.account!);
      final user = await _userRepository.getAccount(id: currentUser);
      emit(ProfileState.initialized(user: user));
    } on BadRequestException catch (e) {
      emit(ProfileState.error(error: e.message));
    }
  }

  Future<void> _reset(_Reset event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.initial());
  }

  @override
  Future<void> close() {
    _createAccountSubscription.cancel();
    _authSubscription.cancel();
    return super.close();
  }
}
