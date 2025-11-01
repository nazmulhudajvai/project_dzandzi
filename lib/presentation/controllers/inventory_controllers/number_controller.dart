import 'package:get/get.dart';

class NumberController extends GetxController {
  var currentValue = 1.obs;

  void increment() => currentValue++;
  void decrement() {
    if (currentValue > 1) {
      currentValue--;
    }
  }
}