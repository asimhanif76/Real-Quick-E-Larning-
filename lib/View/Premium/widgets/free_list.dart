import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FreeList extends StatelessWidget {
  const FreeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        5.h.height,
        CustomContainer(
          height: 28.h,
          width: double.infinity,
          borders: true,
          borderCol: AppColors.gray,
          circular: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.check),
                    3.w.width,
                    CustomTextWidget(
                      title: '5 Publishes per month',
                      color: AppColors.black54,
                    ),
                  ],
                ),
                2.h.height,
                Row(
                  children: [
                    SvgPicture.asset(AppImages.check),
                    3.w.width,
                    CustomTextWidget(
                      title: '4 AI-voice options',
                      color: AppColors.black54,
                    ),
                  ],
                ),
                2.h.height,

                Row(
                  children: [
                    SvgPicture.asset(AppImages.check),
                    3.w.width,
                    CustomTextWidget(
                      title: 'Standard captions',
                      color: AppColors.black54,
                    ),
                  ],
                ),
                2.h.height,

                /////
                ///
                Row(
                  children: [
                    SvgPicture.asset(AppImages.cut),
                    3.w.width,
                    CustomTextWidget(
                      title: '50 publishes per month',
                      color: AppColors.black54,
                    ),
                  ],
                ),
                2.h.height,

                Row(
                  children: [
                    SvgPicture.asset(AppImages.cut),
                    3.w.width,
                    CustomTextWidget(
                      title: 'Access all AI voice library',
                      color: AppColors.black54,
                    ),
                  ],
                ),
                2.h.height,

                Row(
                  children: [
                    SvgPicture.asset(AppImages.cut),
                    3.w.width,
                    CustomTextWidget(
                      title: 'Stylish captions',
                      color: AppColors.black54,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        13.h.height,
        MainCustomButton(title: 'Continue', onTap: () {}),
      ],
    );
  }
}
