import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_phone_event.dart';
part 'auth_phone_state.dart';

class AuthPhoneBloc extends Bloc<AuthPhoneEvent, AuthPhoneState> {
  AuthPhoneBloc() : super(AuthPhoneInitial()) {
    on<AuthPhoneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
