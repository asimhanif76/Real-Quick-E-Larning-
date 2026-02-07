import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/Themes/caption_text_field.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/utils/text_field_custam.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideoCaption extends StatelessWidget {
  VideoCaption({super.key});

  TextEditingController captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return GlassContainer(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 4.w,
                    ),
                    child: Column(
                      children: [
                        CaptionTextField(
                          controller: captionController,
                          hintText: 'Write caption',
                          fontSize: 20,
                          textColor: AppColors.white,
                          suffixIcon: AppImages.tick,
                          onSuffixTap: () => Navigator.pop(context),
                        ),
                        1.5.h.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            CustomContainer(
                              circular: 3.w,
                              borderCol: Colors.white70,
                              borders: true,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 12,
                                ),
                                child: Row(
                                  children: [
                                    CustomTextWidget(
                                      title: '+ Edit style',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Container(
                                        height: 3.h,
                                        width: 2,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      AppImages.edit,
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        1.5.h.height,
                        CustomContainer(
                          color: Colors.transparent,
                          borderCol: Colors.white70,
                          borders: true,
                          circular: 15,
                          child: SizedBox(width: double.infinity, height: 5.h),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text('Edit Caption'),
        ),
      ),
    );
  }
}
