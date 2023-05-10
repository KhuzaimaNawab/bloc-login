part of 'auth_gmail_bloc.dart';

@immutable
abstract class AuthGmailState {}

class AuthGmailInitial extends AuthGmailState {}

class AuthLoggedInState extends AuthGmailState {
  final User user;

  AuthLoggedInState({required this.user});
}

class AuthLoggedOutState extends AuthGmailState{}

class AuthLoadingState extends AuthGmailState {}

class AuthSuccessState extends AuthGmailState {}

class AuthFailureState extends AuthGmailState {}

