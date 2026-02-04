import 'package:e_learning/Controller/HomeController/home_controller.dart';
import 'package:e_learning/Controller/HomeController/video_record_controller.dart';
import 'package:e_learning/View/Home/widgets/camera_screen.dart';
import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/custamContainer.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:camera/camera.dart';
import 'package:e_learning/Controller/HomeController/video_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());
  final VideoCameraController videoRecordController = Get.put(
    VideoCameraController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: GlassContainer(
        child: SizedBox(
          height: 83.h,
          width: 90.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomContainer(
                      circular: 10,
                      borderCol: Colors.black12,
                      borders: true,
                      child: Container(
                        width: 60.w,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  AppImages.profileimage,
                                ),
                              ),
                              2.w.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        title: 'Hi John',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SvgPicture.asset(
                                        AppImages.diamond,
                                        height: 3.h,
                                      ),
                                    ],
                                  ),
                                  CustomTextWidget(
                                    title: 'Welcome Back Today',
                                    color: AppColors.black54,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    10.w.width,
                  ],
                ),

                2.h.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      circular: 18,
                      borderCol: Colors.black12,
                      borders: true,
                      child: Container(
                        width: 40.w,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Column(
                            children: [
                              SvgPicture.asset(AppImages.download),
                              1.5.h.height,
                              CustomTextWidget(
                                title: 'Import Video',
                                color: AppColors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ////
                    ///
                    ///
                    CustomContainer(
                      onTap: () {
                        // videoRecordController.switchCamera();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CameraScreen(),
                          ),
                        );
                      },
                      circular: 18,
                      borderCol: Colors.black12,
                      borders: true,
                      child: Container(
                        width: 40.w,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Column(
                            children: [
                              SvgPicture.asset(AppImages.camara),
                              1.5.h.height,
                              CustomTextWidget(
                                title: 'Camera',
                                color: AppColors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                2.h.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      title: '  History',
                      fontWeight: FontWeight.w500,
                    ),
                    CustomTextWidget(
                      title: 'View all ',
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
                2.h.height,

                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomContainer(
                                  width: 24.w,
                                  height: 10.h,
                                  circular: 10,
                                  imageDecoration: DecorationImage(
                                    image: AssetImage(AppImages.imagedame),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                1.w.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: CustomTextWidget(
                                        title: 'Tracy Courthouse Rebid',
                                        color: Color(0xff272727),
                                      ),
                                    ),
                                    CustomTextWidget(
                                      title: 'October 25, 2019',
                                      color: AppColors.black54,
                                    ),
                                    1.5.h.height,
                                    CustomTextWidget(
                                      title: '5 months ago, 50MB',
                                      color: AppColors.black54,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SvgPicture.asset(AppImages.line),
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
    );
  }
}

////////////
// ///
// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> with WidgetsBindingObserver {
//   final VideoCameraController controller = Get.put(VideoCameraController());

//   @override
//   void initState() {
//     super.initState();
//     // Set to fullscreen
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//     WidgetsBinding.instance.addObserver(this);
//     controller.initializeCamera();
//   }

//   @override
//   void dispose() {
//     // Restore system UI
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final cameraController = controller.cameraController;

//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return;
//     }

//     if (state == AppLifecycleState.inactive) {
//       cameraController.dispose();
//     } else if (state == AppLifecycleState.resumed) {
//       controller.initializeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Obx(
//         () {
//           if (!controller.isInitialized.value) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(color: Colors.white),
//                   SizedBox(height: 20),
//                   Text(
//                     'Initializing Camera...',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ],
//               ),
//             );
//           }

//           // Get screen size
//           final size = MediaQuery.of(context).size;
//           final deviceRatio = size.width / size.height;

//           return Stack(
//             children: [
//               // Camera Preview - Full Screen with proper aspect ratio
//               SizedBox(
//                 width: size.width,
//                 height: size.height,
//                 child: FittedBox(
//                   fit: BoxFit.cover,
//                   child: SizedBox(
//                     width: size.width,
//                     height: size.width * controller.cameraController!.value.aspectRatio,
//                     child: CameraPreview(controller.cameraController!),
//                   ),
//                 ),
//               ),

//               // Top gradient overlay
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   height: 120,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.black.withOpacity(0.6),
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               // Bottom gradient overlay
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       colors: [
//                         Colors.black.withOpacity(0.6),
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               // Close Button
//               Positioned(
//                 top: MediaQuery.of(context).padding.top + 10,
//                 left: 10,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.5),
//                     shape: BoxShape.circle,
//                   ),
//                   child: IconButton(
//                     icon: Icon(Icons.close, color: Colors.white, size: 28),
//                     onPressed: () => Get.back(),
//                   ),
//                 ),
//               ),

//               // Switch Camera Button
//               Positioned(
//                 top: MediaQuery.of(context).padding.top + 10,
//                 right: 10,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.5),
//                     shape: BoxShape.circle,
//                   ),
//                   child: IconButton(
//                     icon: Icon(Icons.flip_camera_ios, color: Colors.white, size: 28),
//                     onPressed: () => controller.switchCamera(),
//                   ),
//                 ),
//               ),

//               // Recording Indicator
//               if (controller.isRecording.value)
//                 Positioned(
//                   top: MediaQuery.of(context).padding.top + 80,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             width: 12,
//                             height: 12,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Text(
//                             'REC',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//               // Record Button
//               Positioned(
//                 bottom: 50,
//                 left: 0,
//                 right: 0,
//                 child: Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       if (controller.isRecording.value) {
//                         controller.stopRecording();
//                       } else {
//                         controller.startRecording();
//                       }
//                     },
//                     child: Container(
//                       width: 85,
//                       height: 85,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.white, width: 6),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(7),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: controller.isRecording.value
//                                 ? Colors.red
//                                 : Colors.white,
//                             shape: controller.isRecording.value
//                                 ? BoxShape.rectangle
//                                 : BoxShape.circle,
//                             borderRadius: controller.isRecording.value
//                                 ? BorderRadius.circular(10)
//                                 : null,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }