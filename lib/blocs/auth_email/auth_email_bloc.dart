import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
part 'auth_email_event.dart';
part 'auth_email_state.dart';

class AuthEmailBloc extends Bloc<AuthEmailEvent, AuthEmailState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthEmailBloc() : super(AuthEmailInitial()) {
    
  }

  void signInWithEmailPassword(String email, String password) {
    try {
      final credential =
          _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
