import 'dart:ui';
import 'package:e_learning/Controller/on_boarding_controller.dart';
import 'package:e_learning/Routes/app_routes.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/custom_Button.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomContainer(
        onTap: () {},
        height: double.infinity,
        width: double.infinity,
        imageDecoration: DecorationImage(
          image: AssetImage(AppImages.background),
          fit: BoxFit.cover,
        ),
        child: Stack(
          children: [
            // Top BackGroung Container
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   child: SizedBox(
            //     width: 45.w,
            //     child: Image.asset(AppImages.bgTopContainer),
            //   ),
            // ),

            // Bottom BackGround Container
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   left: 0,
            //   child: Image.asset(AppImages.bgBottomContainer),
            // ),

            // PageView Images
            _pageviewBuilder(pageController),

            // Glass Container + Page Indicator + Continue Button
            _glassContainer(pageController, context),
            // _customGlassContainer(pageController),

            // Skip Button
            _skipButton(pageController, context),
          ],
        ),
      ),
    );
  }

  Widget _glassContainer(PageController pageController, BuildContext context) {
    return Positioned(
      bottom: 3.h,
      left: 20,
      right: 20,
      child: GlassContainer(
        child: SizedBox(
          height: 31.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              children: [
                3.h.height,
                Obx(
                  () => Text(
                    controller
                        .onboardingList[controller.currentPage.value]
                        .title,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                1.h.height,
                Obx(
                  () => Text(
                    controller
                        .onboardingList[controller.currentPage.value]
                        .description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                3.h.height,

                // Page Indicator (Dots)
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.onboardingList.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: controller.currentPage.value == index ? 20 : 8,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          border: controller.currentPage.value != index
                              ? Border.all(color: Color(0XFF917d72))
                              : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  );
                }),
                5.h.height,

                // Continue Button
                MainCustomButton(
                  title: 'Continue',

                  onTap: () {
                    final nextPage = controller.currentPage.value + 1;

                    if (nextPage < controller.onboardingList.length) {
                      pageController.animateToPage(
                        nextPage,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      controller.currentPage.value = nextPage;
                    } else {
                      Navigator.pushNamed(context, AppRoutes.signInPage);
                      print('Call Next Page');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _customGlassContainer(PageController pageController) {
  //   return Positioned(
  //     bottom: 3.h,
  //     left: 20,
  //     right: 20,
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(30),
  //       child: BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
  //         child: Container(
  //           height: 30.h,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(30),

  //             // 🔥 Glass background
  //             color: Colors.white.withOpacity(0.0),

  //             // ✅ REAL glass border
  //             border: Border.all(
  //               width: 1.2,
  //               color: Colors.white.withOpacity(0.4),
  //             ),

  //             // ✨ Soft glow (important!)
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.white.withOpacity(0.15),
  //                 blurRadius: 20,
  //                 spreadRadius: 1,
  //               ),
  //             ],
  //           ),
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 6.w),
  //             child: Column(
  //               children: [
  //                 0.h.height,

  //                 /// Title
  //                 Obx(
  //                   () => Text(
  //                     controller
  //                         .onboardingList[controller.currentPage.value]
  //                         .title,
  //                     style: const TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 24,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                 ),

  //                 1.h.height,

  //                 /// Description
  //                 Obx(
  //                   () => Text(
  //                     controller
  //                         .onboardingList[controller.currentPage.value]
  //                         .description,
  //                     textAlign: TextAlign.center,
  //                     style: const TextStyle(color: Colors.white, fontSize: 16),
  //                   ),
  //                 ),

  //                 0 .h.height,

  //                 /// Dots
  //                 Obx(
  //                   () => Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: List.generate(
  //                       controller.onboardingList.length,
  //                       (index) => AnimatedContainer(
  //                         duration: const Duration(milliseconds: 300),
  //                         margin: const EdgeInsets.symmetric(horizontal: 4),
  //                         height: 8,
  //                         width: controller.currentPage.value == index ? 20 : 8,
  //                         decoration: BoxDecoration(
  //                           color: controller.currentPage.value == index
  //                               ? Colors.white
  //                               : Colors.transparent,
  //                           border: Border.all(color: Colors.white),
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),

  //                 0.h.height,

  //                 /// Button
  //                 MainCustomButton(
  //                   backColour: Colors.white,
  //                   title: 'Continue',
  //                   textColor: Colors.black,

  //                   onTap: () {
  //                     final nextPage = controller.currentPage.value + 1;

  //                     if (nextPage < controller.onboardingList.length) {
  //                       pageController.animateToPage(
  //                         nextPage,
  //                         duration: Duration(milliseconds: 500),
  //                         curve: Curves.easeInOut,
  //                       );
  //                       controller.currentPage.value = nextPage;
  //                     } else {
  //                       print('Call Next Page');
  //                     }
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _pageviewBuilder(PageController pageController) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (index) {
        controller.currentPage.value = index; // update current page
      },

      itemCount: controller.onboardingList.length,
      itemBuilder: (context, index) {
        final data = controller.onboardingList[index];

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                13.h.height,
                SizedBox(
                  height: 42.h,
                  width: 100.w,
                  child: Image.asset(data.image),
                ),
                20.h.height,
              ],
            ),
            Positioned(
              right: -30,
              bottom: 10.h,
              child: Image.asset(
                data.smallImage,
                height: 22.h,
                width: 45.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _skipButton(PageController pageController, BuildContext context) {
    return Positioned(
      top: 6.h,
      right: 6.w,
      child: GlassContainer(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.signInPage);

            print(controller.currentPage.value);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.4.h),
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
