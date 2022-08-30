import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/data/repositories/repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  UserRepository userRepository;

  SignupBloc({required this.userRepository}) : super(SignupInitial()) {
    on<SignUpPressed>(_mapEventToState);
  }

  _mapEventToState(
    SignupEvent event,
    Emitter<SignupState> emit,
  ) async {
    if (event is SignUpPressed) {
      emit(SignupLoading());

      try {
        var user = await userRepository.signup(event.email, event.password,
            event.address, event.name, event.phone);
        emit(SignupSucceed(user: user));
      } catch (e) {
        emit(SignupFailed(message: e.toString()));
      }
    }
  }
}
