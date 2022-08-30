part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpPressed extends SignupEvent {
  final String email, password, name, address, phone;
  const SignUpPressed(
      {required this.email,
      required this.password,
      required this.name,
      required this.address,
      required this.phone});
}
