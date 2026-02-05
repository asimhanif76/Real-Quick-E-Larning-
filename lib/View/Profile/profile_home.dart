import 'package:e_learning/Controller/Profile%20Controller/profile_controller.dart';
import 'package:e_learning/Routes/app_routes.dart';
import 'package:e_learning/View/VideoExport/video_export.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/utils/text_field_custam.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileHome extends StatelessWidget {
  ProfileHome({super.key});

  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.1.w),
        child: GlassContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 3.h),
            child: SizedBox(
              width: 82.w,
              child: Column(
                children: [
                  _profileHeader(),
                  2.h.height,
                  _userInfoCard(),
                  4.5.h.height,
                  _settingsCard(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= PROFILE HEADER =================
  Widget _profileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Obx(
              () => CircleAvatar(
                radius: 5.5.h,
                backgroundImage: controller.profileImage.value != null
                    ? FileImage(controller.profileImage.value!)
                    : null,
                child: controller.profileImage.value == null
                    ? Icon(Icons.person, size: 6.h, color: Colors.white)
                    : null,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: controller.imageFromGallery,
                  child: SvgPicture.asset(AppImages.edit, height: 3.h),
                ),
              ),
            ),
          ],
        ),
        2.h.height,
        Obx(
          () => CustomTextWidget(
            title: controller.name.value,
            color: AppColors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // ================= USER INFO CARD =================
  Widget _userInfoCard() {
    return CustomContainer(
      circular: 18,
      borderCol: Colors.black12,
      borders: true,
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.nameController,
                    focusNode: controller.nameFocusNode,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Enter text',
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.only(top: 1.h),
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: 24,
                        minWidth: 24,
                      ),
                      suffixIcon: _circleIcon(
                        child: SvgPicture.asset(AppImages.edit_1),
                        onTap: () {
                          controller.nameFocusNode.requestFocus();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.black12, height: 3.h),
            CustomTextWidget(
              title: 'Dawoodexample@gmail.com',
              color: AppColors.black54,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  // ================= SETTINGS CARD =================
  Widget _settingsCard(BuildContext context) {
    return CustomContainer(
      circular: 18,
      borderCol: Colors.black12,
      borders: true,
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: 'General',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            _settingsTile(
              icon: AppImages.Change_password,
              title: 'Change Password',
              onTap: () {
                print('Change Password Tap');
              },
            ),
            Divider(color: Colors.black12, height: 0.1.h),
            _settingsTile(
              icon: AppImages.history,
              title: 'History',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.historyPage);
                print('History Tap');
              },
            ),
            Divider(color: Colors.black12, height: 0.1.h),
            _settingsTile(
              icon: AppImages.upgrade_plan,
              title: 'Upgrade Plan',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoExport()),
                );
                print('Upgrade Plan Tap');
              },
            ),
          ],
        ),
      ),
    );
  }

  // ================= SETTINGS TILE =================
  Widget _settingsTile({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.3.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _circleIcon(child: SvgPicture.asset(icon)),
                  4.w.width,
                  CustomTextWidget(
                    title: title,
                    color: AppColors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 4.5.w, color: Colors.black12),
            ],
          ),
        ),
      ),
    );
  }

  // ================= CIRCLE ICON =================
  Widget _circleIcon({required Widget child, VoidCallback? onTap}) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(2.5.w),
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
