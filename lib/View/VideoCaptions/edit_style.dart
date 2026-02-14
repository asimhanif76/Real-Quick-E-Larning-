import 'package:e_learning/Controller/VideoCaption/video_caption_controller.dart';
import 'package:e_learning/View/VideoCaptions/thumb_style.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
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

  void _openColorPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ColorPicker(
            pickerColor: controller.selectedColor.value,
            onColorChanged: (color) {
              controller.selectedColor.value = color;
            },
            enableAlpha: true,
            displayThumbColor: true,
          ),
        );
      },
    );
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
                        color: controller.selectedColor.value.withOpacity(
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
                          color: controller.selectedColor.value.withOpacity(
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
                                  1.h.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextWidget(
                                        title: 'Font weight',
                                        fontSize: 18,
                                        color: AppColors.white,
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.pop(context),
                                        child: SvgPicture.asset(
                                          AppImages.circle_cross,
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

                                  1.5.h.height,
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
                                  1.5.h.height,
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
                                      InkWell(
                                        onTap: () {
                                          controller.setColor(Colors.yellow);
                                        },

                                        child: SvgPicture.asset(
                                          AppImages.select_color,
                                        ),
                                      ),
                                    ],
                                  ),
                                  0.5.h.height,
                                  Obx(
                                    () => CustomContainer(
                                      height: 6.h,
                                      width: double.infinity,
                                      circular: 3.w,
                                      color: controller.selectedColor.value,
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(16.0),
                                  //   child: ColorPicker(
                                  //     pickerColor:
                                  //         controller.selectedColor.value,
                                  //     onColorChanged: (color) {
                                  //       controller.selectedColor.value = color;
                                  //     },
                                  //     enableAlpha: true,
                                  //     displayThumbColor: true,
                                  //   ),
                                  // ),
                                  // Obx(
                                  //   () => CustomContainer(
                                  //     height: 8.h,
                                  //     width: double.infinity,
                                  //     circular: 4.w,
                                  //     color: controller.selectedColor.value,
                                  //   ),
                                  // ),
                                  // 1.h.height,

                                  /// 🌈 Rainbow Slider Line
                                  // Obx(
                                  //   () => SliderTheme(
                                  //     data: SliderTheme.of(context).copyWith(
                                  //       trackHeight: 8,
                                  //       thumbShape: RoundSliderThumbShape(
                                  //         enabledThumbRadius: 10,
                                  //       ),
                                  //       overlayShape: RoundSliderOverlayShape(
                                  //         overlayRadius: 18,
                                  //       ),
                                  //       thumbColor: Colors.white,
                                  //       activeTrackColor: Colors.transparent,
                                  //       inactiveTrackColor: Colors.transparent,
                                  //       trackShape:
                                  //           const RectangularSliderTrackShape(),
                                  //     ),
                                  //     child: Slider(
                                  //       min: 0,
                                  //       max: 1,
                                  //       value: controller.hueValue.value,
                                  //       onChanged: (value) {
                                  //         controller.updateColor(value);
                                  //       },
                                  //     ),
                                  //   ),
                                  // ),

                                  /// 🌈 Gradient Background Under Slider
                                  1.h.height,
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 1.8.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          gradient: LinearGradient(
                                            colors: const [
                                              Colors.red,
                                              Colors.orange,
                                              Colors.yellow,
                                              Colors.green,
                                              Colors.cyan,
                                              Colors.blue,
                                              Colors.purple,
                                              Colors.red,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => SliderTheme(
                                          data: SliderTheme.of(context)
                                              .copyWith(
                                                trackHeight: 0.6.h,
                                                thumbShape: TransparentThumb(
                                                  thumbRadius: 8,
                                                ), // smaller size
                                                overlayShape:
                                                    SliderComponentShape
                                                        .noOverlay,
                                                activeTrackColor:
                                                    Colors.transparent,
                                                inactiveTrackColor:
                                                    Colors.transparent,
                                              ),
                                          child: Slider(
                                            min: 0,
                                            max: 1,
                                            value: controller.hueValue.value,
                                            onChanged: (value) {
                                              controller.updateColor(value);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
