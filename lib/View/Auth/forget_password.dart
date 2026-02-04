import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/utils/text_field_custam.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/custom_Button.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        height: double.infinity,
        width: double.infinity,
        imageDecoration: DecorationImage(
          image: AssetImage(AppImages.hafBackground),
          fit: BoxFit.cover,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            8.h.height,
            GlassContainer(
              child: SizedBox(
                height: 40.h,
                width: 90.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      3.h.height,
                      CustomTextWidget(
                        title: 'Forget password',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomTextWidget(
                        title: 'Enter your email for reset password',
                        color: Colors.black54,
                      ),
                      3.h.height,
                      CustomTextField(
                        hintText: 'Enter your email',
                        title: 'Email',
                      ),

                      1.h.height,
                      Expanded(child: SizedBox()),
                      MainCustomButton(title: 'Continue', onTap: () {}),
                      4.h.height,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
