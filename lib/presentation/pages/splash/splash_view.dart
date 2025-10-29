import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// fixed "theams" → "themes"
import '../../../../res/assets/image_assets.dart';
import '../../../theams/app_color.dart';

class SwitchController extends GetxController {
  var isLoading = true.obs; // controls loading bar
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashView> {
  final SwitchController controller = Get.put(SwitchController());

  @override
  void initState() {
    super.initState();

    // Simulate loading and navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      controller.isLoading.value = false;
      Get.offNamed('signup'); // navigate to next page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 400.w,
          height: 142.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: RadialGradient(
              radius: 1.5,
              transform: const GradientRotation(2.8),
              colors: [AppColor.black, AppColor.blueColor],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 400.w,
            height: 142.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                transform: const GradientRotation(1.8),
                colors: [AppColor.whiteColor, AppColor.black],
              ),
            ),
            child: Center(
              child: Text(
                "Welcome To DzanDzi",
                style: GoogleFonts.roboto(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.blueColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
