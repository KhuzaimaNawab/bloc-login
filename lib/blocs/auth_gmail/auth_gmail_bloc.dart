import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_gmail_event.dart';
part 'auth_gmail_state.dart';

class AuthGmailBloc extends Bloc<AuthGmailEvent, AuthGmailState> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  AuthGmailBloc() : super(AuthGmailInitial()) {
    User? user = _auth.currentUser;
    on<AuthErrorEvent>((event, emit) => emit(AuthFailureState()));

    if (user != null) {
      emit(AuthLoggedInState(user: user));
    } else {
      emit(AuthLoggedOutState());
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    late final OAuthCredential credential;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } on FirebaseException catch (e) {
      print(e.message);
      add(AuthErrorEvent());
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print('lol');
      print(userCredential.user?.displayName);
      return userCredential;
    } on FirebaseException catch (e) {
      print(e.message);
      add(AuthErrorEvent());
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  void logOut() {
    _auth.signOut();
    add(AuthLoggedOutEvent());
  }
}
