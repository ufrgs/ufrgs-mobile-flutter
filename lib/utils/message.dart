import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

void showSnackbarMessage(String message) {
  asuka.showSnackBar(SnackBar(
    content: Text(message),
  ));
}
