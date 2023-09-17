import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/utils/imports.dart';
// Show Snackbar
void showSnackBar({required BuildContext ctx, required String content}) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(content)));
}
// Get image from Gallery
Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      image = File(pickImage.path);
    }
  } catch (e) {
    showSnackBar(ctx: context, content: e.toString());
  }
  return image;
}
