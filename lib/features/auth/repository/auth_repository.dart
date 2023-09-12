import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_clone/utils/imports.dart';
import 'package:whatsapp_clone/utils/utils.dart';

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore storage;
  AuthRepository({required this.auth, required this.storage});
  void signInWithPhoneNumber(
      {String? phoneNumber, required BuildContext ctx}) async {
    try {
      await auth.verifyPhoneNumber(
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
}
