import 'package:get/state_manager.dart';

class VideoCaptionController extends GetxController {
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
