import 'package:e_learning/Routes/app_routes.dart';
import 'package:e_learning/View/Text%20to%20Speach/text_to_speach.dart';
import 'package:e_learning/View/VideoCaptions/video_caption.dart';
import 'package:e_learning/View/VideoExport/video_export.dart';
import 'package:e_learning/core/common/app_keys.dart';
import 'package:e_learning/core/common/utils/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Learning',
          theme: AppThemes.lightTheme,
          scaffoldMessengerKey: scaffoldMessengerKey,
          // routes: AppRoutes.routes,
          // initialRoute: AppRoutes.splashScreen,
          home: TextToSpeach(),
        );
      },
    );
  }
}
