part of 'auth_phone_bloc.dart';

@immutable
abstract class AuthPhoneEvent {}

class AuthStartedEvent extends AuthPhoneEvent {}

class AuthLoggedInEvent extends AuthPhoneEvent {}

class AuthLoggedOutEvent extends AuthPhoneEvent {}

class AuthErrorEvent extends AuthPhoneEvent {
}
