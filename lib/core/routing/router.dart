import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/Auth/view/auth_Screen.dart';
import '../../features/home/home.dart';
import '../../features/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/', builder: (_, __) => const AuthScreen(isSignup: false)),
    GoRoute(
      path: '/signup',
      builder: (_, __) => const AuthScreen(isSignup: true),
    ),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
  ],
);