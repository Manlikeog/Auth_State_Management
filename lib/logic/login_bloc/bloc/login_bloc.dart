import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/data/repositories/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    on<LoginPressed>(_mapEventToState);
  }

  _mapEventToState(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    if (event is LoginPressed) {
      emit(LoginLoading());

      try {
        var user = await userRepository.login(event.email, event.password);
        emit(LoginSucceed(user: user));
      } catch (e) {
        emit(LoginFailed(message: e.toString()));
      }
    }
  }
}
