import 'package:e_learning/Controller/TextToSpeach/text_to_speach_controller.dart';
import 'package:e_learning/View/Text%20to%20Speach/filter_sheet.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextToSpeach extends StatelessWidget {
  TextToSpeach({super.key});

  TextToSpeachController controller = Get.put(TextToSpeachController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              6.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: GlassContainer(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  GlassContainer(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 6,
                      ),
                      child: CustomTextWidget(
                        title: 'Apply',
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
              2.h.height,
              Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: TextSelectionThemeData(
                    cursorColor: AppColors.primaryColor,
                    selectionColor: AppColors.primaryColor.withOpacity(0.3),
                    selectionHandleColor: AppColors.primaryColor.withOpacity(
                      0.7,
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 50.h,
                  child: TextField(
                    controller: controller.textController,
                    cursorColor: AppColors.primaryColor,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    maxLines: null, // important
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(4.w),
                      filled: false,
                      hintText: 'Add text for AI-voiceover',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.white70),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.w)),
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.w)),
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ),
              2.h.height,

              SizedBox(
                height: 35.h,
                child: GlassContainer(
                  color: Colors.black,
                  child: Column(
                    children: [
                      // Header Row
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.h,
                          left: 4.w,
                          right: 4.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              title: 'AI-Artist',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return _artistBottomSheet(context);
                                      },
                                    );
                                  },

                                  child: CustomTextWidget(
                                    title: 'View All',
                                    color: Colors.white70,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: SvgPicture.asset(
                                    AppImages.verticalDivider,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => showFilterBottomSheet(),
                                  child: SvgPicture.asset(
                                    AppImages.voiceFilter,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),

                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.h,
                          ),
                          itemCount: 12,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.w,
                                mainAxisSpacing: 1.5.h,
                                childAspectRatio: 2.4,
                              ),
                          itemBuilder: (_, index) {
                            return artistItem();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _artistBottomSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GlassContainer(
        color: Colors.transparent,
        child: DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.6,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                // color: AppColors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              textSelectionTheme: TextSelectionThemeData(
                                cursorColor: AppColors.primaryColor,
                                selectionColor: AppColors.primaryColor
                                    .withOpacity(0.3),
                                selectionHandleColor: AppColors.primaryColor,
                              ),
                            ),
                            child: TextField(
                              // controller: controller,
                              cursorColor: AppColors.primaryColor,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.w),
                                  borderSide: const BorderSide(
                                    color: Colors.white70,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.w),
                                  borderSide: const BorderSide(
                                    color: Colors.white70,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.transparent,
                                hintText: 'Find AI-agent',
                                hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontFamily: 'nunito',
                                  fontWeight: FontWeight.w500,
                                ),
                                prefixIcon: SizedBox(
                                  width: 8.w,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppImages.searchIcon,
                                      width: 3.3.w,
                                      height: 2.2.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: CaptionTextField(
                        //     hintText: 'Find AI-agent',
                        //     prefixIcon: AppImages.searchIcon,
                        //   ),
                        // ),
                        4.w.width,
                        InkWell(
                          onTap: () => showFilterBottomSheet(),
                          child: SvgPicture.asset(AppImages.voiceFilter),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomContainer(
                      width: double.infinity,
                      height: 5.h,
                      color: Colors.transparent,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 0.w),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => 3.w.width,
                        itemCount: controller.voiceList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selectedVoices.value = index;
                            },
                            child: Obx(
                              () => Center(
                                child: Column(
                                  children: [
                                    0.8.h.height,
                                    CustomTextWidget(
                                      title: controller.voiceList[index],
                                      fontSize: 16,
                                      color:
                                          controller.selectedVoices.value ==
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
                                          controller.selectedVoices.value ==
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CustomContainer(
                          borderCol: Colors.white70,
                          borders: true,
                          circular: 20,
                          width: 16.w,
                          height: 3.5.h,
                          child: CustomTextWidget(
                            title: 'Apply',
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      4.w.width,
                    ],
                  ),

                  SizedBox(height: 1.h),

                  /// FULL GRID LIST
                  Expanded(
                    child: GridView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      itemCount: 30, // full list
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 1.5.h,
                        childAspectRatio: 2.4,
                      ),
                      itemBuilder: (_, index) {
                        return artistItem();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget artistItem() {
    return SizedBox(
      width: 45.w,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 7.5.h,
                width: 15.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  image: DecorationImage(
                    image: AssetImage(AppImages.imagegirl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  width: 4.w,
                  child: SvgPicture.asset(AppImages.diamond),
                ),
              ),
            ],
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: 'Alex',
                  color: Colors.white,
                  maxLines: 1,
                ),
                SizedBox(height: 0.5.h),
                CustomTextWidget(
                  title: 'Fantacy',
                  color: Colors.white70,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
