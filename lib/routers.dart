import 'package:whatsapp_clone/utils/imports.dart';

Route<dynamic> generatedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
