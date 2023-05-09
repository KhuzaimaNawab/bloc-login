part of 'auth_email_bloc.dart';

@immutable
abstract class AuthEmailEvent {}

class AuthStartedEvent extends AuthEmailEvent {}

class AuthLoggedInEvent extends AuthEmailEvent {}

class AuthLoggedOutEvent extends AuthEmailEvent {}

class AuthErrorEvent extends AuthEmailEvent {}
