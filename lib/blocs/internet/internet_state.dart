part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetAvailableState extends InternetState{}

class InternetNotAvailableState extends InternetState{}
