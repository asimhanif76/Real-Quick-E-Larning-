import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class VideoCaptionController extends GetxController {
  // Rx<Color> selectedColor = Colors.amber.shade300.obs;

  RxDouble hueValue = 0.15.obs; // yellow default
  Rx<Color> selectedColor = Rx<Color>(Colors.yellow);

  void updateColor(double hue) {
    hueValue.value = hue;
    selectedColor.value = HSVColor.fromAHSV(1, hue * 360, 1, 1).toColor();
  }

  void setColor(Color color) {
    selectedColor.value = color;

    final hsv = HSVColor.fromColor(color);
    hueValue.value = hsv.hue / 360;
  }

  void resetStyle() {
    // Reset font weight
    selectedWeight.value = 'Regular';

    // Reset text size
    textSize.value = 16.0;

    // Reset opacity
    opacity.value = 1.0;

    // Reset color (default yellow)
    setColor(AppColors.primaryColor);
  }

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
