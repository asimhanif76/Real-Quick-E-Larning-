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

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                    title: 'Sign in',
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
                  1.h.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.forgetPassword);
                      },
                      child: CustomTextWidget(
                        title: 'Forget password',
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  MainCustomButton(
                    title: 'Continue',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.bottomAppBarScreen,
                      );
                    },
                  ),
                  2.h.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        title: 'Don’t have an account? ',
                        color: Colors.black54,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signUpPage);
                        },
                        child: CustomTextWidget(
                          title: ' Sign Up',
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
