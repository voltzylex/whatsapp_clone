import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';
import 'package:whatsapp_clone/utils/assets.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Welcome to WhatsApp",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              Assets.bgImage,
              height: 340,
              width: size.width,
              color: tabColor,
            ),
            SizedBox(height: size.height / 9),
            const Text(
              'Read Our Privacy Policy. Tap "Agree and Continue" to accept the Terms and Service',
              textAlign: TextAlign.center,
              style: TextStyle(color: greyColor),
            ),
            SizedBox(height: size.height / 10),
            CustomButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                text: "Agree and Continue".toUpperCase(),
                ontap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
