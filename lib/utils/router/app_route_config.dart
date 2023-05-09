import 'package:auth_tutorial/screens/home_screen.dart';
import 'package:auth_tutorial/screens/login_screen.dart';
import 'package:auth_tutorial/screens/register_screen.dart';
import 'package:auth_tutorial/screens/reset_password_screen.dart';
import 'package:auth_tutorial/screens/splash_screen.dart';
import 'package:auth_tutorial/screens/verification_screen.dart';
import 'package:auth_tutorial/screens/welcome_screen.dart';
import 'package:auth_tutorial/utils/router/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.splashRouteName,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.welcomeRouteName,
        path: '/#',
        pageBuilder: (context, state) {
          return const MaterialPage(child: WelcomeScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.loginRouteName,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.registerRouteName,
        path: '/register',
        pageBuilder: (context, state) {
          return const MaterialPage(child: RegisterScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.verificationRouteName,
        path: '/user/verify-email',
        pageBuilder: (context, state) {
          return const MaterialPage(child: VerificationScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.resetRouteName,
        path: '/user/reset-password',
        pageBuilder: (context, state) {
          return const MaterialPage(child: ResetPasswordScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.homeRouteName,
        path: '/user/home',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomeScreen());
        },
      ),
    ],
  );
}
