import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void show(
    String message, {
    bool isError = false,
    ToastGravity gravity = ToastGravity.CENTER,
    int durationInSeconds = 2,
  }) {
    Fluttertoast.showToast(
      msg:
          message, // Fallback message for platforms that don't support toastWidget
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: durationInSeconds,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
      webBgColor: isError ? "#FF0000" : "#00FF00",
      webPosition: "center",
      webShowClose: true,
    );
  }
}
