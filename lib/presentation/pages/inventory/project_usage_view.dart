import 'package:dzandzi/presentation/widgets/inventory_widgets/chart_container.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/inventory_usage_chart.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/most_used_item_chart.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectUsageView extends StatelessWidget {
  const ProjectUsageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CustomSearchBar(),
        Row(
          children: [
            Expanded(child: search_bar(onChanged: (String value) {  },)),
            SizedBox(width: 16.w),
            Icon(
              Icons.filter_list,
              size: 24.sp,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        InventoryUsageChart(),
        SizedBox(height: 20.h),
        MostUsedItemsChart(),
        SizedBox(height: 20.h),
        ChartContainer(),
        SizedBox(height: 16.h),
        ChartContainer(),
        SizedBox(height: 16.h),
        ChartContainer(),
        SizedBox(height: 16.h),
        ChartContainer(),
        SizedBox(height: 16.h),
      ],
    );
  }
}
