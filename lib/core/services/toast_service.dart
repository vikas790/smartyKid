import 'package:flutter/material.dart';

class ToastService {
  void errorToast(BuildContext? context, String message) {
    debugPrint("TOAST ERROR: $message");
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
    }
  }

  void successToast(BuildContext? context, String message) {
    debugPrint("TOAST SUCCESS: $message");
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.green));
    }
  }
}
