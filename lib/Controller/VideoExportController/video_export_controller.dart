import 'package:get/get.dart';

class VideoExportController extends GetxController {
  RxInt selectedStandard = 0.obs; // observable selected index

  void select(int index) {
    selectedStandard.value = index;
  }
}
