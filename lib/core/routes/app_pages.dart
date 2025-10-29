 
import 'package:dzandzi/presentation/pages/projects_page/project_document.dart';
import 'package:dzandzi/presentation/pages/projects_page/projects.dart';
import 'package:get/get.dart';
part 'app_routes.dart';
class AppPages {
  AppPages._();

  // Define the initial route
  static const initial = _Paths.ProjectsPage;

  static final routes = [
    // Projects page Route
    GetPage(name: _Paths.ProjectsPage, page: () => ProjectDocument()),
    // // Login Route
    // GetPage(name: _Paths.LOGIN, page: () => LoginScreen()),
    // // Sign Up Route
    // GetPage(name: _Paths.SIGNUP, page: () => SignUpView()),
    // // OTP Route
    // // GetPage(name: _Paths.OTP, page: () => OtpVerifyView()),
    // GetPage(name: Routes.HOME, page: () => HomeView()),
    //  GetPage(name: Routes.PROJECT, page: () => ProjectsView()),
    // GetPage(name: Routes.EMPLOYEES, page: () => EmployeesView()),
    // GetPage(name: Routes.INVENTORY, page: () => InventoryView()),
    // GetPage(name: Routes.PROFILE, page: () => ProfileView()),
  ];
}
