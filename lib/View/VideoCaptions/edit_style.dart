import 'package:e_learning/Controller/VideoCaption/video_caption_controller.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditStyle extends StatelessWidget {
  EditStyle({super.key});

  VideoCaptionController controller = Get.put(VideoCaptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Column(
            children: [
              4.h.height,
              Image.asset('assets/images/temp.png'),
              2.h.height,
              Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: TextSelectionThemeData(
                    cursorColor: AppColors.primaryColor,
                    selectionColor: AppColors.primaryColor.withOpacity(0.3),
                    selectionHandleColor: AppColors.primaryColor,
                  ),
                ),
                child: TextField(
                  controller: controller.captionController,
                  maxLines: 20,
                  cursorColor: AppColors.primaryColor,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    filled: false,
                    hintText: 'Captions',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.w)),
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.w)),
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                  ),
                ),
              ),
              2.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.w),
                      border: Border.all(color: Colors.white38),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      child: CustomTextWidget(
                        title: '+ Edit style',
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
