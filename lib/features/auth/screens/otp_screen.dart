import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/utils/imports.dart';

class OTPScreen extends ConsumerWidget {
  static const routeName = "/otp-screen";
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = TextEditingController();
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text(
          "Verifying your number",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("We have sent a SMS with a code "),
            SizedBox(
              width: size.width / 2,
              child: TextField(
                controller: otpController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "- - - - - -",
                  hintStyle:
                      TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                ),
                onChanged: (value) {
                  if (value.length == 6) {
                    ref
                        .read(authControllerProvider)
                        .VerifyOtp(context, verificationId, value.trim());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
