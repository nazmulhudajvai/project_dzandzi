import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinny_app/presentation/pages/auth/login/login_screen.dart';
import 'package:tinny_app/presentation/pages/common/notify.dart';
import 'package:tinny_app/presentation/pages/auth/sign_up/sign_up_screen.dart';
import 'package:tinny_app/presentation/pages/auth/otp/otp_verify_view.dart';
import 'package:tinny_app/presentation/pages/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // Define the initial route
  static const initial = _Paths.SplashView;

  static final routes = [
    // Splash View Route
    GetPage(name: _Paths.SplashView, page: () => SplashView()),
    // Login Route
    GetPage(name: _Paths.Notification, page: () => CustomNotificationPage()),
    GetPage(name: _Paths.LOGIN, page: () => LoginScreen()),
    // Sign Up Route
    GetPage(name: _Paths.SIGNUP, page: () => SignUpView()),
    // OTP Route
    GetPage(name: _Paths.OTP, page: () => OtpVerifyView()),
  ];
}
