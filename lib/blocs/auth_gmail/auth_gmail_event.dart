part of 'auth_gmail_bloc.dart';

@immutable
abstract class AuthGmailEvent {}

class AuthStartedEvent extends AuthGmailEvent {}

class AuthLoggedInEvent extends AuthGmailEvent {}

class AuthLoggedOutEvent extends AuthGmailEvent {}

class AuthErrorEvent extends AuthGmailEvent {}
