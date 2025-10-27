import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_pages.dart';

/// ✅ Allows self-signed SSL certificate (only for testing phase)
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Apply SSL override
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844), // Your UI reference size
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Tiny App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black, // ✅ Your UI background
          fontFamily: "Inter", // Optional: If you added fonts
        ),
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    ),
  );
}
