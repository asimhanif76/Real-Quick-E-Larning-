import 'package:e_learning/Routes/app_routes.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/utils/text_field_custam.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/custom_Button.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
            height: 80.h,
            width: 90.w,

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  3.h.height,
                  CustomTextWidget(
                    title: 'Sign up',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  2.h.height,
                  CustomTextField(hintText: 'Enter your email', title: 'Email'),
                  2.h.height,
                  CustomTextField(
                    hintText: 'Enter your password',
                    title: 'Password',
                  ),
                  2.h.height,
                  CustomTextField(
                    hintText: 'Re-enter password',
                    title: 'Confirm Password',
                  ),
                  Expanded(child: SizedBox()),
                  MainCustomButton(
                    title: 'Continue',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.premiumPage);
                    },
                  ),
                  2.h.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        title: 'Already have an account?',
                        color: Colors.black54,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CustomTextWidget(
                          title: ' Sign in',
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  2.h.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
