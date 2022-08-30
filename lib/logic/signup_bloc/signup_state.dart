part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSucceed extends SignupState {
  final User? user;
  const SignupSucceed({required this.user});
}

class SignupFailed extends SignupState {
  final String message;
  const SignupFailed({required this.message});
}
