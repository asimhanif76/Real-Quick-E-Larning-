import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomContainer(
        height: double.infinity,
        width: double.infinity,
        imageDecoration: DecorationImage(
          image: AssetImage(AppImages.background),
          fit: BoxFit.cover,
        ),
        child: Column(
          children: [
            6.3.h.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: GlassContainer(
                child: SizedBox(
                  width: 90.w,
                  height: 90.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        2.h.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: GlassContainer(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 4.w,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            CustomTextWidget(
                              title: '  History',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                        2.h.height,

                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CustomContainer(
                                          width: 21.w,
                                          height: 9.5.h,
                                          circular: 10,
                                          imageDecoration: DecorationImage(
                                            image: AssetImage(
                                              AppImages.imagedame,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        1.w.width,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: CustomTextWidget(
                                                title: 'Henderson Barkor',
                                                color: Color(0xff272727),
                                              ),
                                            ),
                                            CustomTextWidget(
                                              title: 'October 25, 2019',
                                              color: AppColors.black54,
                                            ),
                                            1.5.h.height,
                                            CustomTextWidget(
                                              title: '5 hours, 02:30sec',
                                              color: AppColors.black54,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: SvgPicture.asset(
                                            AppImages.line,
                                          ),
                                        ),
                                        3.h.height,
                                        CustomTextWidget(
                                          title: '20MB',
                                          color: AppColors.black54,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
