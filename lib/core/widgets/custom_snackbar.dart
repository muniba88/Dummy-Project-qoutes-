import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  CustomSnackbar({
    super.key,
    required String message,
    String? title,
    IconData? icon,
    Color? backgroundColor,
    super.duration = const Duration(seconds: 3),
  }) : super(
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor ?? Colors.black87,
          content: Row(
            children: [
              if (icon != null) Icon(icon, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    Text(message, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        );
}

void showSuccessSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    CustomSnackbar(
      title: "Success",
      message: message,
      icon: Icons.check_circle,
      backgroundColor: Colors.green,
    ),
  );
}

void showErrorSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    CustomSnackbar(
      title: "Error",
      message: message,
      icon: Icons.error,
      backgroundColor: Colors.red,
    ),
  );
}