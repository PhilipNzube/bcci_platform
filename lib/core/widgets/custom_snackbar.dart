import 'package:flutter/material.dart';

import '../../main.dart';
import 'custom_gap.dart';

class CustomSnackbar {
  static void show(
    BuildContext context,
    String message, {
    bool isError = false,
    bool useNavigatorContext = true, // Default to using navigator context
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: isError ? Colors.red : Colors.green,
          ),
          const Gap(10, isHorizontal: true),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    // Use navigator context if useNavigatorContext is true, otherwise use provided context
    final effectiveContext =
        useNavigatorContext ? navigatorKey.currentContext! : context;
    ScaffoldMessenger.of(effectiveContext).showSnackBar(snackBar);
  }
}
