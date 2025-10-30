import 'package:dzandzi/presentation/pages/projects_page/project_document.dart';
import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav2.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/search_bar.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theams/app_color2.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/buttons/custom_input_widget.dart';
import '../../widgets/employee/employee_card.dart';
import '../common/company_details.dart';

class AllRoles extends StatelessWidget {
  AllRoles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(12),
          child: Text('employee data'),
        ),
      ),
      bottomNavigationBar: CustomBottomNav2(),
    );
  }
}
