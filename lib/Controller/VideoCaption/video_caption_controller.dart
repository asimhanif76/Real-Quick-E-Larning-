import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class VideoCaptionController extends GetxController {
  TextEditingController captionController = TextEditingController();

  RxDouble textSize = 16.0.obs;

  RxDouble opacity = 1.0.obs;

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
  List<String> textWeight = ['Light', 'Regular', 'Medium', 'Bold'];
  RxString selectedWeight = 'Regular'.obs;
}
