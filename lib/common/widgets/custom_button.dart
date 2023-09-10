import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.ontap,
      this.height,
      this.width,
      this.padding});
  final String text;
  final Function()? ontap;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: ontap,
        child: Text(
          text,
          style: const TextStyle(color: blackColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: tabColor,
          minimumSize: const Size(double.infinity, 50),
          // fixedSize: Size(width ?? 250, height ?? 50),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
