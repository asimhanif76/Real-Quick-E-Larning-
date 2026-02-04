import 'package:e_learning/Controller/HomeController/drafts_controller.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DraftsPage extends StatelessWidget {
  DraftsPage({super.key});
  final controller = Get.put(DraftsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Center(
            child: GlassContainer(
              child: SizedBox(
                height: 90.h,
                width: 90.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  child: Column(
                    children: [
                      Center(
                        child: CustomTextWidget(
                          title: 'Drafts',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      3.h.height,
                      Expanded(
                        child: ListView.builder(
                          itemCount: 7,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomContainer(
                                    height: 9.h,
                                    circular: 11,
                                    width: 25.w,
                                    imageDecoration: DecorationImage(
                                      image: AssetImage(AppImages.imagedame),
                                    ),
                                  ),
                                  2.w.width,
                                  Container(
                                    width: 45.w,
                                    margin: EdgeInsets.only(top: 6),
                                    // color: Colors.amber,
                                    child: CustomTextWidget(title: '1 day ago'),
                                  ),

                                  PopupMenuButton<String>(
                                    color: Color(0xfffdf6f1),
                                    borderRadius: BorderRadius.circular(30),
                                    padding: EdgeInsetsGeometry.all(20),
                                    icon: SvgPicture.asset(AppImages.line),
                                    onSelected: (value) {
                                      if (value == 'edit') {
                                        // controller.editDraft(draft.id);
                                      } else if (value == 'delete') {}
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      PopupMenuItem<String>(
                                        value: 'edit',
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(AppImages.edit),
                                              SizedBox(width: 20),
                                              CustomTextWidget(title: 'Edit'),
                                              20.width,
                                            ],
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'delete',
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(AppImages.deleted),
                                            SizedBox(width: 8),
                                            CustomTextWidget(title: '  Delete'),
                                          ],
                                        ),
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
        ),
      ],
    );
  }

  //   void _showDeleteDialog(
  //     BuildContext context,
  //     DraftsController controller,
  //     String draftId,
  //   ) {
  //     Get.dialog(
  //       AlertDialog(
  //         title: const CustomTextWidget(
  //           title: 'Delete Draft',
  //           fontSize: 18,
  //           fontWeight: FontWeight.w600,
  //         ),
  //         content: const CustomTextWidget(
  //           title: 'Are you sure you want to delete this draft?',
  //           fontSize: 14,
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Get.back(),
  //             child: const CustomTextWidget(
  //               title: 'Cancel',
  //               fontSize: 14,
  //               color: Colors.black54,
  //             ),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               controller.deleteDraft(draftId);
  //               Get.back();
  //             },
  //             child: const CustomTextWidget(
  //               title: 'Delete',
  //               fontSize: 14,
  //               color: Colors.red,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
}
