// app_routes.dart
part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const OTP = _Paths.OTP;
  static const SplashView = _Paths.SplashView;
  static const Notification = _Paths.Notification;
}

abstract class _Paths {
  _Paths._();

  static const LOGIN = '/login';
  static const SplashView = '/';
  static const SIGNUP = '/signup';
  static const OTP = '/otp';
  static const Notification = '/notification';
}
