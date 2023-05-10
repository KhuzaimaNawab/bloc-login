import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_phone_event.dart';
part 'auth_phone_state.dart';

class AuthPhoneBloc extends Bloc<AuthPhoneEvent, AuthPhoneState> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationID;
  String? _phoneNo;
  AuthPhoneBloc() : super(AuthPhoneInitial()) {}

  Future<void> sendOtp(
    String phoneNumber,
  ) async {
    _phoneNo = phoneNumber;
    try {
      final code = await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential PhoneAuthCredential) {
            _auth.signInWithCredential(PhoneAuthCredential);
          },
          verificationFailed: (FirebaseAuthException FirebaseAuthException) {
            emit(AuthFailureState(
                message: FirebaseAuthException.message.toString()));
          },
          codeSent: (String verificationId, int? resendToken) {
            verificationID = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationID = verificationId;
          });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    ;
  }

  void verifyOTP(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID!, smsCode: otp);
    await _auth.signInWithCredential(credential);

    if (credential != null) {
      emit(AuthLoggedInState());
    }
  }

  String getPhoneNumber() {
    return _phoneNo!;
  }
}
