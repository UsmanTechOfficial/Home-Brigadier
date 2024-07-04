import 'package:flutter/material.dart';
import 'package:home_brigadier/main.dart';

class CSnackBar{
  static void show(message) async{
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3), // Adjust the duration as needed
      backgroundColor: Colors.black87,
      behavior: SnackBarBehavior.floating, // Optional: Adjust the behavior
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Optional: Adjust the shape
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Perform an action when the action button is pressed
        },
      ),
    );
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}