import 'package:whatsapp_clone/utils/imports.dart';

Widget myText({required String text, FontWeight? fontWeight, double? size}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: size,
    ),
  );
}
