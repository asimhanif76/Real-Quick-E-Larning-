import 'package:e_learning/Controller/VideoCaption/video_caption_controller.dart';
import 'package:e_learning/View/VideoCaptions/edit_style.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/Themes/caption_text_field.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideoCaption extends StatelessWidget {
  VideoCaption({super.key});

  VideoCaptionController controller = Get.put(VideoCaptionController());

  final List<Map<String, dynamic>> cards = [
    {'title': 'None', 'color': Colors.grey},
    {'title': 'New bold', 'color': Colors.blue, 'badge': true},
    {'title': 'Add cap', 'color': Colors.red},
    {'title': 'New bold', 'color': Colors.green},
    {'title': 'Happy word', 'color': Colors.orange},
    {'title': 'Add cap', 'color': Colors.red},
    {'title': 'New bold', 'color': Colors.blue, 'badge': true},
    {'title': 'Add cap', 'color': Colors.red},
    {'title': 'New bold', 'color': Colors.green},
    {'title': 'Happy word', 'color': Colors.orange},
    {'title': 'Add cap', 'color': Colors.red},
  ];

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
                          controller: controller.captionController,
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
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => EditStyle(),
                                //   ),
                                // );
                              },
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
                          width: double.infinity,
                          height: 5.h,
                          color: Colors.transparent,
                          borderCol: Colors.white70,
                          borders: true,
                          circular: 15,
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => 3.w.width,
                            itemCount: controller.fontList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.selectedFontStyle.value = index;
                                },
                                child: Obx(
                                  () => Center(
                                    child: Column(
                                      children: [
                                        0.8.h.height,
                                        CustomTextWidget(
                                          title: controller.fontList[index],
                                          fontSize: 16,
                                          color:
                                              controller
                                                      .selectedFontStyle
                                                      .value ==
                                                  index
                                              ? AppColors.primaryColor
                                              : AppColors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        0.8.h.height, // optional spacing
                                        Container(
                                          height: 2, // thickness of the divider
                                          width: 30, // optional width
                                          color:
                                              controller
                                                      .selectedFontStyle
                                                      .value ==
                                                  index
                                              ? AppColors.primaryColor
                                              : Colors
                                                    .transparent, // highlight selected
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        1.5.h.height,
                        Expanded(
                          child: GridView.builder(
                            itemCount: cards.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 2.h,
                                  childAspectRatio: 1.2,
                                ),
                            itemBuilder: (context, index) {
                              final item = cards[index];

                              return InkWell(
                                onTap: () {
                                  print('Font Style Tapped');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        item['title'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: item['color'],
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      /// 🔹 Diamond badge
                                      if (item['badge'] == true)
                                        Positioned(
                                          bottom: 1.h,
                                          right: 3.w,
                                          child: SvgPicture.asset(
                                            AppImages.diamond,
                                            height: 2.h,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
