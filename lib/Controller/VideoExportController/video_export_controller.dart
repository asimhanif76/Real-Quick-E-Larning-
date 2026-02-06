import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoExportController extends GetxController {
  TextEditingController emailController = TextEditingController();

  RxList emailList = ['Dawoodexample@gmail.com'].obs;
  // RxInt selectedEmail = 0.obs;
  RxInt selectedStandard = 0.obs;

  RxList<int> selectedEmails = <int>[0].obs;

  void toggleEmail(int index) {
    if (selectedEmails.contains(index)) {
      selectedEmails.remove(index); // unselect
    } else {
      selectedEmails.add(index); // select
    }
  }

  void select(int index) {
    selectedStandard.value = index;
  }
}
