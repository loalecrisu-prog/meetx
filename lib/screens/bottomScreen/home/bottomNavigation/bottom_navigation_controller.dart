import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  // index-ul paginii active din bara de jos
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
