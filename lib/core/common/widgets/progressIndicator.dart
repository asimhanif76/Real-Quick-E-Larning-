// import 'package:e_learning/core/common/utils/app_images.dart';
// import 'package:flutter/material.dart';

// class CustomProgressIndicator extends StatelessWidget {
//   final BuildContext context;
//   final double progress;
//   final Color? barColor;

//   const CustomProgressIndicator({
//     super.key,
//     required this.context,
//     required this.progress,
//     this.barColor = const Color(0xff57BA89),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.zero,
//       width: double.infinity,
//       height: 7,
//       decoration: BoxDecoration(
//         // image: DecorationImage(
//         //   image: AssetImage(AppImages.healthBar),
//         //   fit: BoxFit.cover,
//         // ),
//         // color: AppColors.orage,
//         borderRadius: BorderRadius.circular(10),
//         // border: Border.all(color: AppColors.orage),
//       ),
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//           ),
//           LayoutBuilder(
//             builder: (context, constraints) {
//               return Container(
//                 width: constraints.maxWidth * progress,
//                 decoration: BoxDecoration(
//                   // color: AppColors.primaryColor,
//                   borderRadius: BorderRadius.circular(10),
//                   gradient: LinearGradient(
//                     colors: [barColor!, barColor!],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
