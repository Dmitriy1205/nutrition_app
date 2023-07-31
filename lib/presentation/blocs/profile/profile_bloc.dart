import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutrition_app/common/functions.dart';

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
      String phase;
      final currentUser = _authBloc.state.user!.uid;
      final user = await _userRepository.getAccount(id: currentUser);

      DateTime dateOfSaving = parseDateString(user.currentDate!);

      final String season = getSeasonFromLocation(
        latitudeString: user.location!['lat'],
      );

      if (user.irregularCycle == false) {
        CyclePhase cyclePhase = getCurrentCyclePhase(
          dateOfSaving: dateOfSaving,
          dayOfCycle: int.parse(user.dayCycle!),
          cycleLength: int.parse(user.cycleLength!),
          periodLength: int.parse(user.periodLength!),
        );

        phase = cyclePhaseToString(cyclePhase);
        print('phase ---- $phase');
      } else {
        //TODO: add moon period calculation
        phase = '';
        print('season ---- $season');
      }
      print('dateOfSaving ---- $dateOfSaving');
      emit(ProfileState.initialized(user: user, season: season, phase: phase));
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
      final String season = '';
      final String phase = '';
      emit(ProfileState.initialized(user: user, season: season, phase: phase));
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
