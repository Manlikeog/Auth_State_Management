part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginPressed({required this.email, required this.password});
}
