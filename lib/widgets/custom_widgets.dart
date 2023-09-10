import 'package:whatsapp_clone/utils/imports.dart';

Text myText({required String text, FontWeight? fontWeight, double? size}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: size,
    ),
  );
}

// myTextField
TextField myTextField({
  required TextEditingController controller,String? hint = "",
   
}) {
  return TextField(
    decoration: InputDecoration(
      hintText: hint
    ),
  );
}
