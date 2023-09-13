import 'dart:developer';

import 'package:whatsapp_clone/common/widgets/custom_button.dart';
import 'package:whatsapp_clone/utils/imports.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login-screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                SizedBox( dfgssg
                    width: size.width * 0.75,
                    child: myTextField(
                        controller: phoneController, hint: "Phone number")),
              ],
            ),
            const Spacer(),
            CustomButton(
                text: "Next".toUpperCase(),
                ontap: () {},
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
}
// very tired