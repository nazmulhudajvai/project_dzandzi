import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProjectTabbarcontroler extends GetxController {
  var selectedIndex = 0.obs; // Default selected tab (Task)

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}