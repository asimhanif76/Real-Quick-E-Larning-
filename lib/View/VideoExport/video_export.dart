import 'package:e_learning/Controller/VideoExportController/video_export_controller.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/utils/text_field_custam.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/custom_Button.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideoExport extends StatelessWidget {
  VideoExport({super.key});

  final List<String> standards = [
    'SCROM 1.2',
    'SCROM 2004',
    'AICC',
    'XAPI',
    'CMI5',
  ];

  VideoExportController controller = Get.put(VideoExportController());

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
        child: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
          child: GlassContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _filePreviewSection(),
                    2.h.height,
                    _assetsInfoSection(),
                    2.h.height,
                    _learningStandardSection(),
                    2.h.height,
                    _emailSelectionSection(context),
                    2.h.height,
                    MainCustomButton(title: 'Export', onTap: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= FILE PREVIEW =================
  Widget _filePreviewSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 15.h,
              width: 33.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                image: DecorationImage(
                  image: AssetImage(AppImages.imagedame),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: InkWell(
                onTap: () => debugPrint("Edit Button Pressed"),
                child: SvgPicture.asset(AppImages.edit_2, height: 4.h),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(4.w),
          child: const CustomTextWidget(title: 'File Name'),
        ),
      ],
    );
  }

  // ================= ASSETS INFO =================
  Widget _assetsInfoSection() {
    return _outlinedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            title:
                'All selected assets will be compiled into a single SCORM package.',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          1.h.height,
          _assetRow(AppImages.video, 'Video'),
          _assetRow(AppImages.audio, 'Audio'),
          _assetRow(AppImages.caption, 'Caption'),
        ],
      ),
    );
  }

  Widget _assetRow(String icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.4.h),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          2.w.width,
          CustomTextWidget(title: title, fontSize: 16),
        ],
      ),
    );
  }

  // ================= LEARNING STANDARD =================
  Widget _learningStandardSection() {
    return _outlinedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            title: 'Select learning standard',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          GridView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: standards.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemBuilder: (_, index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: _radioButton(index),
                title: CustomTextWidget(title: standards[index], fontSize: 16),
                subtitle: index == 0
                    ? const CustomTextWidget(
                        title: '(default)',
                        color: AppColors.black54,
                      )
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _radioButton(int index) {
    return InkWell(
      onTap: () => controller.selectedStandard.value = index,
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12),
          ),
          child: Container(
            height: 5.w,
            width: 5.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.selectedStandard.value == index
                  ? AppColors.primaryColor
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  // ================= EMAIL SECTION =================
  Widget _emailSelectionSection(BuildContext context) {
    return _outlinedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            title: 'Select email',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          1.5.h.height,
          Row(
            children: [
              SvgPicture.asset(AppImages.checkBox),
              3.w.width,
              const CustomTextWidget(
                title: 'Dawoodexample@gmail.com',
                fontSize: 16,
              ),
            ],
          ),
          2.h.height,
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppColors.primaryColor,
                                  ),
                                  2.w.width,
                                  CustomTextWidget(
                                    title: 'You can add maximum 5 emails',
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              TextField(
                                cursorColor: AppColors.primaryColor,
                                decoration: InputDecoration(
                                  hintText: 'write email',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ), // bottom border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 2,
                                    ), // bottom border when focused
                                  ),
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.only(top: 1.h),
                                  suffixIconConstraints: const BoxConstraints(
                                    minHeight: 24,
                                    minWidth: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Center(
              child: const CustomTextWidget(title: '+ Add email', fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // ================= COMMON CONTAINER =================
  Widget _outlinedContainer({required Widget child}) {
    return CustomContainer(
      width: 100.w,
      borders: true,
      borderCol: Colors.black12,
      circular: 4.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: child,
      ),
    );
  }

  Widget _circleIcon({required Widget child, VoidCallback? onTap}) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12),
          ),
          child: child,
        ),
      ),
    );
  }
}
