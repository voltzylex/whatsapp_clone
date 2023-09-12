import 'package:whatsapp_clone/utils/imports.dart';

void showSnackBar({required BuildContext ctx, required String content}) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(content)));
}
