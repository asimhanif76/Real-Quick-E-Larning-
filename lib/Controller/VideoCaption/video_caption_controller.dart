import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class VideoCaptionController extends GetxController {
  TextEditingController captionController = TextEditingController();

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
