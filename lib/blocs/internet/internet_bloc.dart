import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _myStream;
  InternetBloc() : super(InternetInitial()) {

    on<InternetAvailableEvent>((event, emit) {
      emit(InternetAvailableState());
    });

    on<InternetNotAvailableEvent>(
        (event, emit) => emit(InternetNotAvailableState()));
    _myStream = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetAvailableEvent());
      } else if (event == ConnectivityResult.none) {
        add(InternetNotAvailableEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _myStream?.cancel();
    return super.close();
  }
}
