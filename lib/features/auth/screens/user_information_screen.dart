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
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/premium-vector/account-icon-user-icon-vector-graphics_292645-552.jpg?w=2000"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo_rounded)),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
