import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CaptionTextField extends StatelessWidget {
  final TextEditingController? controller;

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

  const CaptionTextField({
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

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines ?? 1,
      cursorColor: AppColors.primaryColor,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontFamily: 'nunito',
        fontWeight: FontWeight.w500,
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
    );
  }
}
