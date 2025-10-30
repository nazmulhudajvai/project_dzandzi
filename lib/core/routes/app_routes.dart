// app_routes.dart
part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const OTP = _Paths.OTP;
  static const SplashView = _Paths.SplashView;
  static const Notification = _Paths.Notification;
  static const HOME = _Paths.HOME;
  static const Document = _Paths.Document;
  static const PROJECT = '/projects';
  static const EMPLOYEES = '/employees';
  static const INVENTORY = '/inventory';
  static const PROFILE = '/profile';
  static const InventoryView = _Paths.InventoryView;
}

abstract class _Paths {
  _Paths._();
  
  static const LOGIN = '/login';
  static const SplashView = '/';
  static const ProjectsPage = '/projectpage';
  static const SIGNUP = '/signup';
  static const OTP = '/otp';
  static const Notification = '/notification';
  static const HOME = '/home';
  static const Document = '/document';
  static const InventoryView = '/inventory';
}
