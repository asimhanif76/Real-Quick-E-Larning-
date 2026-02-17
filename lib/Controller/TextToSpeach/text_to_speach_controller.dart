import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextToSpeachController extends GetxController {
  TextEditingController textController = TextEditingController();

  RxInt selectedVoices = 1.obs;

  List<String> voiceList = [
    'All',
    'Female',
    'New',
    'Trending',
    'Male',
    'Impact',
    'Character',
  ];
}
