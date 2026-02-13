import 'package:e_learning/Controller/VideoCaption/video_caption_controller.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditStyle extends StatelessWidget {
  EditStyle({super.key});

  VideoCaptionController controller = Get.put(VideoCaptionController());

  FontWeight _getFontWeight(String weight) {
    switch (weight) {
      case 'Light':
        return FontWeight.w300;
      case 'Regular':
        return FontWeight.w400;
      case 'Medium':
        return FontWeight.w500;
      case 'Bold':
        return FontWeight.w700;
      default:
        return FontWeight.w400;
    }
  }

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
                        color: AppColors.white.withOpacity(
                          controller.opacity.value,
                        ),
                        fontWeight: _getFontWeight(
                          controller.selectedWeight.value,
                        ),
                      ),

                      decoration: InputDecoration(
                        filled: false,
                        hintText: 'Captions',
                        hintStyle: TextStyle(
                          fontSize: controller.textSize.value,
                          color: AppColors.white.withOpacity(
                            controller.opacity.value,
                          ),
                          fontWeight: _getFontWeight(
                            controller.selectedWeight.value,
                          ),
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
                          return GlassContainer(
                            color: Colors.black,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  5.h.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextWidget(
                                        title: 'Font weight',
                                        fontSize: 18,
                                        color: AppColors.white,
                                      ),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(
                                          Icons.cancel,
                                          size: 7.w,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  1.h.height,
                                  SizedBox(
                                    height: 3.5.h,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          2.w.width,
                                      itemCount: controller.textWeight.length,
                                      itemBuilder: (context, index) {
                                        final weight =
                                            controller.textWeight[index];

                                        return Obx(() {
                                          final isSelected =
                                              controller.selectedWeight.value ==
                                              weight;
                                          return GestureDetector(
                                            onTap: () =>
                                                controller
                                                        .selectedWeight
                                                        .value =
                                                    weight,
                                            child: CustomContainer(
                                              borderCol: isSelected
                                                  ? AppColors.primaryColor
                                                  : Colors.white,

                                              circular: 2.w,
                                              borders: true,
                                              color: isSelected
                                                  ? AppColors.primaryColor
                                                  : Colors.transparent,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                ),
                                                child: Center(
                                                  child: CustomTextWidget(
                                                    title: weight,
                                                    color: Colors.white,
                                                    fontWeight: _getFontWeight(
                                                      weight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                    ),
                                  ),

                                  2.h.height,
                                  CustomTextWidget(
                                    title: 'Size',
                                    fontSize: 18,
                                    color: AppColors.white,
                                  ),
                                  1.h.height,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(() {
                                        double min = 10;
                                        double max = 30;
                                        double value =
                                            controller.textSize.value;

                                        double percentage =
                                            ((value - min) / (max - min)) * 100;

                                        return Text(
                                          '${percentage.toInt()}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                  0.5.h.height,
                                  Obx(
                                    () => _customSlider(
                                      context: context,
                                      minValue: 10,
                                      maxValue: 30,
                                      value: controller.textSize.value,
                                      onChanged: (value) =>
                                          controller.textSize.value = value,
                                    ),
                                  ),
                                  2.h.height,
                                  CustomTextWidget(
                                    title: 'Opacity',
                                    fontSize: 18,
                                    color: AppColors.white,
                                  ),
                                  1.h.height,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(() {
                                        double value = controller.opacity.value;
                                        return Text(
                                          '${(value * 100).toInt()}%',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                  0.5.h.height,
                                  Obx(
                                    () => _customSlider(
                                      context: context,
                                      minValue: 0,
                                      maxValue: 1,
                                      value: controller.opacity.value,
                                      onChanged: (value) =>
                                          controller.opacity.value = value,
                                    ),
                                  ),
                                  1.h.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextWidget(
                                        title: 'Select Colors',
                                        fontSize: 18,
                                        color: AppColors.white,
                                      ),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(
                                          Icons.cancel,
                                          size: 7.w,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  2.h.height,
                                ],
                              ),
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

  Widget _customSlider({
    required BuildContext context,
    required double minValue,
    required double maxValue,
    required double value,
    required ValueChanged onChanged,
  }) {
    return Container(
      height: 1.5.h,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 1.h,
          padding: EdgeInsets.all(0),
          activeTrackColor: AppColors.primaryColor,
          inactiveTrackColor: Colors.black,

          thumbColor: AppColors.primaryColor.withOpacity(0.8),
          overlayColor: Colors.transparent,

          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 7,
            disabledThumbRadius: 7,
            elevation: 0,
            pressedElevation: 0,
          ),

          // overlayShape:
          //     const RoundSliderOverlayShape(
          //       overlayRadius: 0,
          //     ),
        ),
        child: Slider(
          min: minValue,
          max: maxValue,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
