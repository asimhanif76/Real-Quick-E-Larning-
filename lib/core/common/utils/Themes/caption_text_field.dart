import 'package:e_learning/Controller/VideoCaption/video_caption_controller.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CaptionTextField extends StatelessWidget {
  final TextEditingController? controller;

  VideoCaptionController videoCaptionController = Get.put(
    VideoCaptionController(),
  );

  /// text related
  final String hintText;
  final double? fontSize;
  final int? maxLines;
  final Color? textColor;

  /// suffix icon related
  final String? suffixIcon;
  final double? suffixIconWidth;
  final double? suffixIconHeight;
  final VoidCallback? onSuffixTap;

  CaptionTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.fontSize,
    this.maxLines,
    this.textColor,
    this.suffixIcon,
    this.suffixIconWidth,
    this.suffixIconHeight,
    this.onSuffixTap,
  });

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
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primaryColor,
          selectionColor: AppColors.primaryColor.withOpacity(0.3),
          selectionHandleColor: AppColors.primaryColor,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines ?? 1,
        cursorColor: AppColors.primaryColor,
        style: TextStyle(
          fontSize: videoCaptionController.textSize.value,
          color: videoCaptionController.selectedColor.value.withOpacity(
            videoCaptionController.opacity.value,
          ),
          fontWeight: _getFontWeight(
            videoCaptionController.selectedWeight.value,
          ),
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.w),
            borderSide: const BorderSide(color: Colors.white70),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.w),
            borderSide: const BorderSide(color: Colors.white70),
          ),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: TextStyle(
            color: textColor?.withOpacity(0.7),
            fontSize: fontSize,
            fontFamily: 'nunito',
            fontWeight: FontWeight.w500,
          ),

          /// suffix icon (optional)
          suffixIcon: suffixIcon == null
              ? null
              : InkWell(
                  onTap: onSuffixTap,
                  child: SizedBox(
                    width: 8.w,
                    child: Center(
                      child: SvgPicture.asset(
                        suffixIcon!,
                        width: (suffixIconWidth ?? 4).w,
                        height: (suffixIconHeight ?? 3).h,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
