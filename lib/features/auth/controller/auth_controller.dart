import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/auth/repository/auth_repository.dart';
import 'package:whatsapp_clone/utils/imports.dart';

final authControllerProvider = Provider((ref) {
  final authrepo = ref.watch(authRepsitoryProvider);
  return AuthController(authRepository: authrepo);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  // Sign in With Phone number
  void signInWithPhonenumber(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhoneNumber(
        ctx: context, phoneNumber: phoneNumber);
  }

  // Sing in with otp
  void VerifyOtp(
      BuildContext context, String verificationNumber, String userOtp) {
    authRepository.verifyOTP(
        context: context, verificationId: verificationNumber, userOtp: userOtp);
  }
}
