import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedPageIndex = 0.obs;

  void changePage(int index) {
    selectedPageIndex.value = index;
  }


}
