import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_gmail_event.dart';
part 'auth_gmail_state.dart';

class AuthGmailBloc extends Bloc<AuthGmailEvent, AuthGmailState> {
  AuthGmailBloc() : super(AuthGmailInitial()) {
    on<AuthGmailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
