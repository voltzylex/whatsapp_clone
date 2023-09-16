import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_clone/features/auth/screens/user_information_screen.dart';
import 'package:whatsapp_clone/utils/imports.dart';
import 'package:whatsapp_clone/utils/utils.dart';

final authRepsitoryProvider = Provider((ref) => AuthRepository(
    auth: FirebaseAuth.instance, storage: FirebaseFirestore.instance));

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore storage;
  AuthRepository({required this.auth, required this.storage});
  // Sign in with phone number
  void signInWithPhoneNumber(
      {String? phoneNumber, required BuildContext ctx}) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.popAndPushNamed(ctx, OTPScreen.routeName,
              arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(ctx: ctx, content: e.toString());
    }
  }

  // Verify Otp
  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOtp}) async {
    try {
      final PhoneAuthCredential phoneAuthCredential =
          PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: userOtp);
      await auth.signInWithCredential(phoneAuthCredential);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInfomationScreen.routeName, (route) => false);
    } on FirebaseException catch (e) {
      log("Firebase exception " + e.message.toString());
    }
  }
}
