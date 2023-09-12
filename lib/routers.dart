import 'package:whatsapp_clone/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_clone/utils/imports.dart';

Route<dynamic> generatedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(builder: (_) =>  OTPScreen(verificationId: verificationId,));
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
