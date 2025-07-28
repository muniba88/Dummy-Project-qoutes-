import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../services/local_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final token = LocalStorageService.getString('access_token');
    // Wait for 2 seconds before navigating
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      if (token != null && token.isNotEmpty) {
        context.go('/home');
      } else {
        context.go('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 52),
        child: Center(
          child: Row(
            children: [
              Spacer(),
              // Text in front of the image
              Text(
                "educatro",
                style: AppFonts.splash.copyWith(
                  color: Colors.white,
                ), // add color if needed
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}