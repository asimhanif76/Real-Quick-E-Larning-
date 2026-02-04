import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final Widget? child;
  final double? circular;
  final bool? borders;
  final Color? borderCol;
  final bool grading;
  final VoidCallback? onTap;
  final bool? shadow;
  final DecorationImage? imageDecoration;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final double? borderWidth;
  final BoxConstraints? boxConstraints;

  CustomContainer({
    this.height,
    this.width,
    this.child,
    this.color,
    this.borders = false,
    this.circular = 1,
    this.borderCol = AppColors.lightGray,
    this.grading = false,
    this.onTap,
    this.shadow,
    this.imageDecoration,
    this.boxConstraints,
    this.margin,
    this.radius = 2,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: boxConstraints,
        height: height,
        width: width,
        margin: margin, // Set margin around the container
        decoration: BoxDecoration(
          boxShadow: shadow == true
              ? [
                  BoxShadow(
                    color: AppColors.primaryColor,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                    spreadRadius: -4, // 🔥 key for inner shadow
                  ),
                ]
              // [
              //     BoxShadow(
              //       color: const Color.fromARGB(255, 212, 152, 124),
              //       // Colors.grey.withOpacity(0.3), // Shadow color
              //       spreadRadius: 1, // The extent of the shadow
              //       blurRadius: 5, // The blurring of the shadow
              //       offset: const Offset(0, -2), // Positioning of the shadow
              //     ),
              //   ]
              : null,
          color: grading ? null : color,
          // gradient: grading
          //     ? RadialGradient(
          //         colors: [AppColors.primaryColor2, AppColors.black],
          //         radius: radius!,
          //         // center: Alignment(0, -0.1),
          //       )
          //     : null,
          border: borders == true
              ? Border.all(color: borderCol!, width: borderWidth!)
              : null,

          borderRadius: BorderRadius.circular(circular!),
          image: imageDecoration, // Use the provided imageDecoration
        ),
        child: Center(child: child),
      ),
    );
  }
}
