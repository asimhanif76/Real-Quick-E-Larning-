import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class VideoCaptionController extends GetxController {
  TextEditingController captionController = TextEditingController();

  RxDouble textSize = 16.0.obs;

  RxInt selectedFontStyle = 1.obs;
  List<String> fontList = [
    'All',
    'Free',
    'Stylish',
    'Bold pop',
    'Heavy hit',
    'Impact',
    'Character',
  ];
}
