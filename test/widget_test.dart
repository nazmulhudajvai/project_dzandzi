import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinny_app/core/routes/app_pages.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app environment
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => GetMaterialApp(
          title: 'Tiny App',
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initial, // your home route
          getPages: AppPages.routes,
        ),
      ),
    );

    await tester.pumpAndSettle(); // wait for any animations or async

    // Now try to find your counter, e.g., Text('0')
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify increment
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
