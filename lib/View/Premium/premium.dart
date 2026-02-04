import 'package:e_learning/Controller/PremiumController/premium_controller.dart';
import 'package:e_learning/View/Premium/widgets/free_list.dart';
import 'package:e_learning/View/Premium/widgets/unlock_premium_list.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PremiumPage extends StatelessWidget {
  PremiumPage({super.key});
  final controller = Get.put(PremiumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        height: double.infinity,
        width: double.infinity,
        imageDecoration: DecorationImage(
          image: AssetImage(AppImages.background),
          fit: BoxFit.cover,
        ),
        child: GlassContainer(
          child: SizedBox(
            height: 85.h,
            width: 90.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  2.h.height,
                  CustomTextWidget(
                    textAlign: TextAlign.center,
                    title: 'Unlock more features with premium ',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  1.h.height,
                  SvgPicture.asset(AppImages.permium),
                  2.h.height,
                  CustomContainer(
                    width: double.infinity,
                    height: 60,
                    borderCol: AppColors.gray,
                    circular: 28,
                    borders: true,
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomContainer(
                            // shadow: true,
                            onTap: () {
                              controller.premium.value = false;
                            },
                            width: 37.w,
                            height: 50,
                            circular: 50,
                            color: controller.premium == false
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            child: CustomTextWidget(
                              title: 'Standard (Free)',
                              color: controller.premium == false
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          CustomContainer(
                            // shadow: true,
                            onTap: () {
                              controller.premium.value = true;
                            },
                            width: 40.w,
                            height: 50,
                            circular: 50,
                            color: controller.premium == true
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            child: CustomTextWidget(
                              textAlign: TextAlign.center,
                              fontSize: 14,
                              title: 'Unlock Premium \n7-Days Free trail',
                              color: controller.premium == true
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.premium == true
                        ? UnlockPremiumList()
                        : FreeList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
