import 'package:flutter/material.dart';

SnackBar BuildErrorWidget(BuildContext context) {
  return SnackBar(
    content: const Text(
      'An error occurred. Please try again.',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
    behavior:
        SnackBarBehavior.floating, // Makes the SnackBar float above the UI
    margin: const EdgeInsets.all(16), // Adds a margin around the SnackBar
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: Colors.white,
      onPressed: () {
        ScaffoldMessenger.of(context)
            .hideCurrentSnackBar(); // Closes the SnackBar
      },
    ),
  );
}
