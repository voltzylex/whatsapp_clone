import 'package:whatsapp_clone/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_clone/routers.dart';
import 'package:whatsapp_clone/utils/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(color: appBarColor)),
      onGenerateRoute: generatedRoutes,
      home: const ResponsiveLayout(
        mobileScreenLayout: LandingScreen(),
        // MobileLayoutScreen(),
        webScreenLayout: WebLayoutScreen(),
      ),
    );
  }
}
