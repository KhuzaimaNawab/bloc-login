part of 'auth_email_bloc.dart';

@immutable
abstract class AuthEmailState {}

class AuthEmailInitial extends AuthEmailState {}

class AuthLoggedInState extends AuthEmailState {
  final User user;

  AuthLoggedInState({required this.user});
}

class AuthLoggedOutState extends AuthEmailState{}

class AuthLoadingState extends AuthEmailState {}

class AuthSuccessState extends AuthEmailState {}

class AuthFailureState extends AuthEmailState {}
