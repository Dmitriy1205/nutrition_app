import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:nutrition_app/common/functions/functions.dart';
import 'package:nutrition_app/common/functions/moon_phase.dart';
import '../../../common/exceptions.dart';
import '../../../data/models/account/account.dart';
import '../../../data/models/subscription/subscription.dart';
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
      subscribe: (e) => _subscribe(e, emit),
      unsubscribe: (e) => _unsubscribe(e, emit),
    );
  }

  Future<void> _fetchData(_FetchData event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      String phase;
      String? currentDayOfCycle = '';
      final currentUser = _authBloc.state.user!.uid;
      final userAccount = await _userRepository.getAccount(id: currentUser);

      DateTime dateOfSaving = parseDateString(userAccount.currentDate!);

      final String season = getSeasonFromLocation(
        latitudeString: userAccount.location!['lat'],
      );

      if (userAccount.irregularCycle == false) {
        CyclePhase cyclePhase = getCurrentCyclePhase(
          dateOfSaving: dateOfSaving,
          dayOfCycle: int.parse(userAccount.dayCycle!),
          cycleLength: int.parse(userAccount.cycleLength!),
          periodLength: int.parse(userAccount.periodLength!),
        );
        currentDayOfCycle = getCurrentDayOfCycle(dateOfSaving, int.parse(userAccount.dayCycle!), int.parse(userAccount.cycleLength!));
        phase = cyclePhaseToString(cyclePhase);
        print('phase ---- $phase');
      } else {
        //TODO: add moon period calculation
        MoonPhase moonPhase = calculateMoonPhase(
            double.parse(userAccount.location!['lat']),
            double.parse(userAccount.location!['lng']));
        phase = getCycleByMoon(moonPhase: moonPhase);
        print('season ---- $moonPhase');
        print('season ---- $phase');
      }
      print('dateOfSaving ---- $dateOfSaving');
      emit(ProfileState.initialized(
          user: userAccount, season: season, phase: phase, dayOfCycle: currentDayOfCycle!));
    } on BadRequestException catch (e) {
      emit(ProfileState.error(error: e.message));
    }
  }

  Future<void> _updateData(
      _UpdateData event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      String phase;
      String? currentDayOfCycle = '';
      final currentUser = _authBloc.state.user!.uid;
      await _userRepository.updateAccount(
          userId: currentUser, data: event.account!);
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
        currentDayOfCycle = getCurrentDayOfCycle(dateOfSaving, int.parse(user.dayCycle!), int.parse(user.cycleLength!));

        phase = cyclePhaseToString(cyclePhase);
        print('phase ---- $phase');
      } else {
        //TODO: add moon period calculation
        MoonPhase moonPhase = calculateMoonPhase(
            double.parse(user.location!['lat']),
            double.parse(user.location!['lng']));
        phase = getCycleByMoon(moonPhase: moonPhase);
        print('season ---- $moonPhase');
        print('season ---- $phase');
      }
      emit(ProfileState.initialized(user: user, season: season, phase: phase, dayOfCycle: currentDayOfCycle!));
    } on BadRequestException catch (e) {
      emit(ProfileState.error(error: e.message));
    }
  }

  Future<void> _reset(_Reset event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.initial());
  }

  Future<void> _subscribe(_Subscribe event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      String? formattedEnd;
      String? currentDayOfCycle = '';
      DateTime currentDate = DateTime.now();
      String formattedCurrentDate =
          DateFormat('dd.MM.yyyy').format(currentDate);
      if (event.isTrial != null && event.isTrial!) {
        DateTime dateAfterThreeDays = currentDate.add(const Duration(days: 3));
        formattedEnd = DateFormat('dd.MM.yyyy').format(dateAfterThreeDays);
      }
      if (event.isOneMonth != null && event.isOneMonth!) {
        DateTime dateAfterMonth = currentDate.add(const Duration(days: 30));
        formattedEnd = DateFormat('dd.MM.yyyy').format(dateAfterMonth);
      }
      if (event.isOneYear != null && event.isOneYear!) {
        DateTime dateAfterYear = currentDate.add(const Duration(days: 365));
        formattedEnd = DateFormat('dd.MM.yyyy').format(dateAfterYear);
      }
      final currentUser = _authBloc.state.user!.uid;
      await _userRepository.updateSubscription(
          userId: currentUser,
          data: Subscription(
            isTrial: event.isTrial ?? false,
            isOneYear: event.isOneYear ?? false,
            isOneMonth: event.isOneMonth ?? false,
            isSubscribed: event.isSubscribed ?? false,
            startDate: formattedCurrentDate,
            endDate: formattedEnd!,
          ));
      ///////////////////////////////////////////
      String phase;
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
        currentDayOfCycle = getCurrentDayOfCycle(dateOfSaving, int.parse(user.dayCycle!), int.parse(user.cycleLength!));

        phase = cyclePhaseToString(cyclePhase);
        print('phase ---- $phase');
      } else {
        //TODO: add moon period calculation
        MoonPhase moonPhase = calculateMoonPhase(
            double.parse(user.location!['lat']),
            double.parse(user.location!['lng']));
        phase = getCycleByMoon(moonPhase: moonPhase);
        print('season ---- $moonPhase');
        print('season ---- $phase');
      }

      emit(ProfileState.initialized(user: user, season: season, phase: phase, dayOfCycle: currentDayOfCycle!));
    } on BadRequestException catch (e) {
      emit(ProfileState.error(error: e.message));
    }
  }

  Future<void> _unsubscribe(
      _Unsubscribe event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      final currentUser = _authBloc.state.user!.uid;
      String? currentDayOfCycle = '';
      await _userRepository.updateSubscription(
          userId: currentUser,
          data: const Subscription(
            isTrial: false,
            isOneYear: false,
            isOneMonth: false,
            isSubscribed: false,
            startDate: '',
            endDate: '',
          ));
      String phase;
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
        currentDayOfCycle = getCurrentDayOfCycle(dateOfSaving, int.parse(user.dayCycle!), int.parse(user.cycleLength!));

        phase = cyclePhaseToString(cyclePhase);
        print('phase ---- $phase');
      } else {
        //TODO: add moon period calculation
        MoonPhase moonPhase = calculateMoonPhase(
            double.parse(user.location!['lat']),
            double.parse(user.location!['lng']));
        phase = getCycleByMoon(moonPhase: moonPhase);
        print('season ---- $moonPhase');
        print('season ---- $phase');
      }

      emit(ProfileState.initialized(user: user, season: season, phase: phase, dayOfCycle: currentDayOfCycle!));
    } on BadRequestException catch (e) {
      emit(ProfileState.error(error: e.message));
    }
  }

  @override
  Future<void> close() {
    _createAccountSubscription.cancel();
    _authSubscription.cancel();
    return super.close();
  }
}
