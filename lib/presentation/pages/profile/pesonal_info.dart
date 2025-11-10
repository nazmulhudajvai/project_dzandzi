import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theams/app_color2.dart';
import '../../controllers/profile/profile_controller.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/buttons/custom_input_widget.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final ProfileController controller = Get.find<ProfileController>();

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;

  bool isEditing = false; // Track if fields are editable

  @override
  void initState() {
    super.initState();

    firstNameController = TextEditingController(text: controller.firstName.value);
    lastNameController = TextEditingController(text: controller.lastName.value);
    emailController = TextEditingController(text: controller.email.value);
    phoneController = TextEditingController(text: controller.phone.value);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back_outlined, size: 24),
                    ),
                    const Spacer(),
                    Text(
                      "Personal Information",
                      style: GoogleFonts.roboto(
                        color: AppColor.greyBC,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 20.h),

                // Avatar Section
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Obx(
                            () => CircleAvatar(
                          radius: 62.r,
                          backgroundImage: controller.avatarFile.value != null
                              ? FileImage(controller.avatarFile.value!) as ImageProvider
                              : controller.avatarUrl.value.isNotEmpty
                              ? NetworkImage(controller.avatarUrl.value)
                              : const AssetImage('assets/image/pprofile.png'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            await controller.pickImageFromGallery();
                          },
                          child: Container(
                            width: 34.w,
                            height: 34.h,
                            decoration: BoxDecoration(
                              color: AppColor.blueColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                'assets/image/iedit.svg',
                                height: 20.h,
                                width: 20.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                // User Details (read-only or editable)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Custom_details(
                          title: 'First Name',
                          detailsWidget: isEditing
                              ? CustomInputWidget(
                            cwidth: 170.w,
                            radius: 50.r,
                            cheight: 44.h,
                            hintText: '',
                            controller: firstNameController,
                            onChanged: (v) {},
                          )
                              : Text(
                            controller.firstName.value,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          width: 170.w,
                          height: 44.h,
                        ),
                        SizedBox(width: 5.w),
                        Custom_details(
                          title: 'Last Name',
                          detailsWidget: isEditing
                              ? CustomInputWidget(
                            cwidth: 170.w,
                            radius: 50.r,
                            cheight: 44.h,
                            hintText: '',
                            controller: lastNameController,
                            onChanged: (v) {},
                          )
                              : Text(
                            controller.lastName.value,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          width: 170.w,
                          height: 44.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Custom_details(
                      title: 'Phone Number',
                      detailsWidget: isEditing
                          ? CustomInputWidget(
                        cwidth: 380.w,
                        radius: 100.r,
                        cheight: 44.h,
                        hintText: '',
                        controller: phoneController,
                        onChanged: (v) {},
                      )
                          : Text(
                        controller.phone.value,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      width: 380.w,
                      height: 44.h,
                    ),
                    SizedBox(height: 10.h),
                    Custom_details(
                      title: 'Email Address',
                      detailsWidget: isEditing
                          ? CustomInputWidget(
                        cwidth: 380.w,
                        radius: 100.r,
                        cheight: 44.h,
                        hintText: '',
                        controller: emailController,
                        onChanged: (v) {},
                      )
                          : Text(
                        controller.email.value,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      width: 380.w,
                      height: 44.h,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),

                // Edit Details Button
                CustomButton(
                  onPress: () async {
                    if (isEditing) {
                      // Save changes
                      controller.firstName.value =
                          firstNameController.text.trim();
                      controller.lastName.value =
                          lastNameController.text.trim();
                      controller.email.value =
                          emailController.text.trim();
                      controller.phone.value =
                          phoneController.text.trim();

                      await controller.updateProfile(callServer: true);
                      setState(() {
                        isEditing = false;
                      });

                      Get.snackbar(
                        'Success',
                        'Details updated successfully',
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      // Enable editing
                      setState(() {
                        isEditing = true;
                      });
                    }
                  },
                  title: isEditing ? 'Save Changes' : 'Edit Details',
                  leadingIcon: 'assets/image/iedit.svg',
                  leadingIconHeight: 20.h,
                  leadingIconWeight: 20.w,
                  radius: 50.r,
                  leading: true,
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class Custom_details extends StatelessWidget {
  const Custom_details({
    super.key,
    required this.title,
    required this.detailsWidget,
    required this.width,
    required this.height,
  });

  final String title;
  final Widget detailsWidget;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            color: AppColor.greyBC,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColor.border1Color),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 10.0, top: 8.0),
            child: detailsWidget,
          ),
        ),
      ],
    );
  }
}
