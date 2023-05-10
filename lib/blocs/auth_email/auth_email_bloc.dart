import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'auth_email_event.dart';
part 'auth_email_state.dart';

class AuthEmailBloc extends Bloc<AuthEmailEvent, AuthEmailState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthEmailBloc() : super(AuthEmailInitial()) {
    User? user = _auth.currentUser;

    on<AuthErrorEvent>((event, emit) => emit(AuthFailureState()));

    if (user != null) {
      emit(AuthLoggedInState(user: user));
    } else {
      emit(AuthLoggedOutState());
    }
  }

  Future<UserCredential>? signInWithEmailPassword(
      String email, String password) {
    try {
      final credential =
          _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseException catch (e) {
      add(AuthErrorEvent());
      print(e.toString());
      return null;
    }
  }

  void signOut() {
    _auth.signOut();
    emit(AuthLoggedOutState());
  }
}
