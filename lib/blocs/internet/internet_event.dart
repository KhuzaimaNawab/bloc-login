part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class InternetAvailableEvent extends InternetEvent{}

class InternetNotAvailableEvent extends InternetEvent{}
