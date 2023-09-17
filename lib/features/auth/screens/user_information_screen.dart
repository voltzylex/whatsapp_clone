
import 'package:whatsapp_clone/utils/imports.dart';
class UserInfomationScreen extends ConsumerStatefulWidget {
  static const String routeName = "/user-information";
  const UserInfomationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserInfomationScreenState();
}

class _UserInfomationScreenState extends ConsumerState<UserInfomationScreen> {
  // Controllers
  final nameController = TextEditingController();
  File? image;
  // Widgets
  Stack addImageWidget() {
    return Stack(
      children: [
        image == null
            ? const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    Assets.demoIageUrl),
              )
            : CircleAvatar(
                radius: 64,
                backgroundImage: FileImage(image!),
              ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
              onPressed: selectImage,
              icon: const Icon(Icons.add_a_photo_rounded)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            addImageWidget(),
            Row(
              children: [
                Container(
                  width: size.width * 0.85,
                  padding: const EdgeInsets.all(20),
                  child: myTextField(
                    controller: nameController,
                    hint: "Enter Your Name",
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.done)),
              ],
            )
          ],
        ),
      )),
    );
  }

  // Widget Cycle
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  // Pick image
  selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }
}
