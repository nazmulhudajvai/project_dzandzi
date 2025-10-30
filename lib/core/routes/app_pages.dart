
import 'package:dzandzi/presentation/pages/projects_page/Project_task.dart';
import 'package:dzandzi/presentation/pages/projects_page/project_document.dart';
import 'package:dzandzi/presentation/pages/projects_page/projects.dart';
import 'package:dzandzi/presentation/pages/splash/splash_view.dart';
import 'package:get/get.dart';

import '../../presentation/pages/auth/sign_up/sign_up_screen.dart';
import '../../presentation/pages/home/home_view.dart';
import '../../presentation/pages/profile/my_profile.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // Define the initial route
  static const initial = _Paths.ProjectsPage;

  static final routes = [
    // Projects page Route
    GetPage(name: _Paths.SplashView, page: () => SplashView()),
    // Login Route
    // GetPage(name: _Paths.LOGIN, page: () => LoginScreen()),
    // Sign Up Route
    GetPage(name: _Paths.SIGNUP, page: () => SignUpView()),
    // // OTP Route
    // // GetPage(name: _Paths.OTP, page: () => OtpVerifyView()),
    GetPage(name: Routes.HOME, page: () => HomeView()),
    GetPage(name: Routes.PROJECT, page: () => ProjectTask()),
    // GetPage(name: Routes.EMPLOYEES, page: () => EmployeesView()),
    // GetPage(name: Routes.INVENTORY, page: () => InventoryView()),
    GetPage(name: Routes.PROFILE, page: () => ProfileView()),
  ];
}
