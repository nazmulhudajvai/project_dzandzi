import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/pages/auth/login/login_screen.dart';
import '../../presentation/pages/auth/otp/otp_verify_view.dart';
import '../../presentation/pages/auth/sign_up/sign_up_screen.dart';
import '../../presentation/pages/home/home_view.dart';
import '../../presentation/pages/projects/project.dart';
import '../../presentation/pages/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // Define the initial route
  static const initial = _Paths.SplashView;

  static final routes = [
    // Splash View Route
    GetPage(name: _Paths.SplashView, page: () => SplashView()),
    // Login Route
    GetPage(name: _Paths.LOGIN, page: () => LoginScreen()),
    // Sign Up Route
    GetPage(name: _Paths.SIGNUP, page: () => SignUpView()),
    // OTP Route
    // GetPage(name: _Paths.OTP, page: () => OtpVerifyView()),
    GetPage(name: Routes.HOME, page: () => HomeView()),
     GetPage(name: Routes.PROJECT, page: () => ProjectsView()),
    // GetPage(name: Routes.EMPLOYEES, page: () => EmployeesView()),
    // GetPage(name: Routes.INVENTORY, page: () => InventoryView()),
    // GetPage(name: Routes.PROFILE, page: () => ProfileView()),
  ];
}
