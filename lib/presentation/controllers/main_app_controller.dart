import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainAppController extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  Future<void> logout(BuildContext context, Widget redirectPage) async {
    // Clear stored session data
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'userId');

    // Optionally clear all stored values
    // await _storage.deleteAll();

    // Redirect to Intro/Login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => redirectPage),
    );
  }
}
