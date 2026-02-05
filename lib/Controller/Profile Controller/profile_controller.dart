import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileController extends GetxController {
  // RxString name = 'john'.obs;

  TextEditingController nameController = TextEditingController(text: 'john');
  final FocusNode nameFocusNode = FocusNode();
  RxString name = 'john'.obs;

  @override
  void onInit() {
    super.onInit();

    // 👇 sync TextField → RxString
    nameController.addListener(() {
      name.value = nameController.text;
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    nameFocusNode.dispose();
    super.onClose();
  }

  final ImagePicker _picker = ImagePicker();

  Rx<File?> profileImage = Rx<File?>(null);

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (image != null) {
      profileImage.value = File(image.path);
    }
  }

  void imageFromGallery() {
    pickImage(ImageSource.gallery);
  }

  Widget _pickerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }
}
