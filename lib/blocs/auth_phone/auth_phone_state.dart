part of 'auth_phone_bloc.dart';

@immutable
abstract class AuthPhoneState {}

class AuthPhoneInitial extends AuthPhoneState {}

class AuthLoggedInState extends AuthPhoneState {
}

class AuthLoggedOutState extends AuthPhoneState {}

class AuthLoadingState extends AuthPhoneState {}

class AuthSuccessState extends AuthPhoneState {}

class AuthFailureState extends AuthPhoneState {
  final String message;

  AuthFailureState({required this.message});
}
