import 'package:whatsapp_clone/utils/imports.dart';

class UserInfomationScreen extends ConsumerStatefulWidget {
  static const String routeName = "/user-information";
  const UserInfomationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserInfomationScreenState();
}

class _UserInfomationScreenState extends ConsumerState<UserInfomationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          children: [
            
          ],
        ),
      )),
    );
  }
}
