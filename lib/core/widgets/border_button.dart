import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? buttonColor;
  final Color? textColor;

  const BorderButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.buttonColor, // optional
    this.textColor, // optional
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.backgroundLight,
          foregroundColor: textColor ?? AppColors.backgroundDark,
          padding: EdgeInsets.zero,
          side: const BorderSide(
            color: AppColors.backgroundDark,
          ), // Border added
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child:
            isLoading
                ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.backgroundDark,
                    ),
                  ),
                )
                : Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? AppColors.backgroundDark,
                  ),
                ),
      ),
    );
  }
}