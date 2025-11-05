import 'package:get/get.dart';

class ProjectTabbarcontroler extends GetxController {
  var selectedIndex = 0.obs; // Default selected tab (Task)

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
