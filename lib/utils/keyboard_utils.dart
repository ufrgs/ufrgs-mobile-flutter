import 'package:flutter/cupertino.dart';

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}
