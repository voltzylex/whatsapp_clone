import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/utils/imports.dart';
import 'package:whatsapp_clone/utils/utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/login-screen";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  Country? country;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: myText(text: 'Enter your phone number'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            myText(text: "WhatsApp will need to verify your number "),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  countryPicker(context);
                },
                child: myText(text: "Pick Country")),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                if (country != null) myText(text: '+${country?.phoneCode}'),
                const SizedBox(width: 10),
                SizedBox(
                    width: size.width * 0.75,
                    child: myTextField(
                      controller: phoneController,
                      hint: "Phone number",
                    )),
              ],
            ),
            const Spacer(),
            CustomButton(
                text: "Next".toUpperCase(),
                ontap: sendPhoneNumber,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.3)),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void countryPicker(
    BuildContext context,
  ) {
    return showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country value) {
        setState(() {
          log(value.toString());
          country = value;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    log(phoneNumber + country!.phoneCode);
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhonenumber(context, "+${country!.phoneCode}$phoneNumber");
      log("+${country!.phoneCode}$phoneNumber");
      return;
    } else {
      showSnackBar(ctx: context, content: "Fill Out all the fields");
    }
  }
}
// very tired