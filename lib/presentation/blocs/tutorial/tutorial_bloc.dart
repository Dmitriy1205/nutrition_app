import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutrition_app/data/models/tutorial/tutorial.dart';

import '../../../common/exceptions.dart';
import '../../../data/repositories/user_repository.dart';
import '../auth/auth_bloc.dart';

part 'tutorial_event.dart';

part 'tutorial_state.dart';

part 'tutorial_bloc.freezed.dart';

class TutorialBloc extends Bloc<TutorialEvent, TutorialState> {
  final UserRepository _userRepository;
  final AuthBloc _authBloc;

  TutorialBloc({
    required UserRepository userRepository,
    required AuthBloc authBloc,
  })  : _userRepository = userRepository,
        _authBloc = authBloc,
        super(const TutorialState.initial()) {
    on<TutorialEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
      TutorialEvent event, Emitter<TutorialState> emit) async {
    await event.map(
        createTutorial: (e) => _createTutorial(e, emit),
        updateTutorial: (e) => _updateTutorial(e, emit),
        getTutorial: (e) => _getTutorial(e, emit));
  }

  Future<void> _createTutorial(
      _CreateTutorial event, Emitter<TutorialState> emit) async {
    emit(const TutorialState.loading());
    try {
      final currentUser = _authBloc.state.user!.uid;
      await _userRepository.writeTutorial(userId: currentUser);

      emit(const TutorialState.loaded());
    } on BadRequestException catch (e) {
      emit(TutorialState.error(error: e.message));
    }
  }

  Future<void> _updateTutorial(
      _UpdateTutorial event, Emitter<TutorialState> emit) async {
    emit(const TutorialState.loading());
    try {
      final currentUser = _authBloc.state.user!.uid;
      await _userRepository.updateTutorial(
          userId: currentUser, data: event.data);
      final tutorial = await _userRepository.getTutorial(id: currentUser);

      emit( TutorialState.loaded(tutorial: tutorial));
    } on BadRequestException catch (e) {
      emit(TutorialState.error(error: e.message));
    }
  }

  Future<void> _getTutorial(
      _GetTutorial event, Emitter<TutorialState> emit) async {
    emit(const TutorialState.loading());
    try {
      final currentUser = _authBloc.state.user!.uid;
      final tutorial = await _userRepository.getTutorial(id: currentUser);

      emit(TutorialState.loaded(tutorial: tutorial));
    } on BadRequestException catch (e) {
      emit(TutorialState.error(error: e.message));
    }
  }
}
