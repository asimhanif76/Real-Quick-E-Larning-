import 'package:e_learning/Controller/PremiumController/premium_controller.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UnlockPremiumList extends StatelessWidget {
  UnlockPremiumList({super.key});
  final controller = Get.put(PremiumController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        2.h.height,
        Obx(
          () => CustomContainer(
            onTap: () {
              controller.monthly.value = true;
            },
            height: 12.h,
            width: double.infinity,
            borders: true,
            borderCol: controller.monthly == false
                ? AppColors.gray
                : AppColors.primaryColor,
            circular: 15,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => SvgPicture.asset(
                      controller.monthly == true
                          ? AppImages.fillRedio
                          : AppImages.redioButton,
                    ),
                  ),
                  4.w.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomTextWidget(title: '\$19.99', fontSize: 20),
                          CustomTextWidget(
                            title: '/monthly',
                            color: AppColors.black54,
                          ),
                        ],
                      ),
                      CustomTextWidget(
                        title: 'You can cancel anytime \nsubscription ',
                        color: AppColors.black54,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        /////
        1.5.h.height,

        ///
        Obx(
          () => CustomContainer(
            onTap: () {
              controller.monthly.value = false;
            },
            height: 12.h,
            width: double.infinity,
            borders: true,
            borderCol: controller.monthly == true
                ? AppColors.gray
                : AppColors.primaryColor,
            circular: 15,
            child: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    controller.monthly == false
                        ? AppImages.fillRedio
                        : AppImages.redioButton,
                  ),

                  4.w.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomTextWidget(title: '\$200', fontSize: 20),
                          CustomTextWidget(
                            title: '/yearly',
                            color: AppColors.black54,
                          ),
                          15.w.width,
                          CustomContainer(
                            width: 23.w,
                            height: 30,
                            circular: 50,
                            color: AppColors.primaryColor,
                            child: CustomTextWidget(
                              title: 'save 20%',
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      CustomTextWidget(
                        title: 'You can cancel anytime \nsubscription ',
                        color: AppColors.black54,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        /////
        2.h.height,

        ///
        CustomContainer(
          height: 14.h,
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
                      title: '50 publishes per month',
                      color: AppColors.black54,
                    ),
                  ],
                ),
                1.5.h.height,
                Row(
                  children: [
                    SvgPicture.asset(AppImages.check),
                    3.w.width,
                    CustomTextWidget(
                      title: 'Access all AI voice library',
                      color: AppColors.black54,
                    ),
                  ],
                ),
                1.5.h.height,

                Row(
                  children: [
                    SvgPicture.asset(AppImages.check),
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
        2.h.height,
        MainCustomButton(title: 'Continue', onTap: () {}),
      ],
    );
  }
}
