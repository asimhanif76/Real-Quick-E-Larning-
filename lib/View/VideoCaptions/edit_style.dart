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
                child: Obx(
                  () => ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 60.h,
                      minHeight: 30.h,
                    ),
                    child: TextField(
                      controller: controller.captionController,
                      maxLines: 20,
                      cursorColor: AppColors.primaryColor,
                      style: TextStyle(
                        fontSize: controller.textSize.value,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        filled: false,
                        hintText: 'Captions',
                        hintStyle: TextStyle(
                          fontSize: controller.textSize.value,
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
                ),
              ),
              2.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.black,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Column(
                              children: [
                                5.h.height,
                                CustomTextWidget(
                                  title: 'Text Size',
                                  fontSize: 18,
                                  color: AppColors.white,
                                ),
                                Obx(
                                  () => Container(
                                    height: 1.5.h, // tight fit
                                    // padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        // width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        trackHeight: 1
                                            .h, // almost same as container height
                                        padding: EdgeInsets.all(0),
                                        activeTrackColor:
                                            AppColors.primaryColor,
                                        inactiveTrackColor: Colors.black,

                                        thumbColor: AppColors.primaryColor
                                            .withOpacity(0.8),
                                        overlayColor: Colors.transparent,

                                        thumbShape: const RoundSliderThumbShape(
                                          enabledThumbRadius:
                                              7, // touches border
                                          disabledThumbRadius: 7,
                                          elevation: 0,
                                          pressedElevation: 0,
                                        ),

                                        overlayShape:
                                            const RoundSliderOverlayShape(
                                              overlayRadius: 0,
                                            ),
                                      ),
                                      child: Slider(
                                        min: 10,
                                        max: 30,
                                        value: controller.textSize.value,
                                        onChanged: (value) {
                                          controller.textSize.value = value;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                2.h.height,
                                Text('data'),
                                2.h.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() {
                                      double min = 10;
                                      double max = 30;
                                      double value = controller.textSize.value;

                                      double percentage =
                                          ((value - min) / (max - min)) * 100;

                                      return Text(
                                        'Text Size: ${percentage.toInt()}%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
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
