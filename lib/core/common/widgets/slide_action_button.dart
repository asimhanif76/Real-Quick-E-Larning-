// import 'package:e_learning/core/Extension/extension.dart';
// import 'package:e_learning/core/common/utils/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class SlideActionButton extends StatefulWidget {
//   final String text;
//   final VoidCallback? onSubmit;

//   const SlideActionButton({Key? key, required this.text, this.onSubmit})
//     : super(key: key);

//   @override
//   SlideActionButtonState createState() => SlideActionButtonState();
// }

// class SlideActionButtonState extends State<SlideActionButton> {
//   final GlobalKey _containerKey = GlobalKey();
//   final GlobalKey _sliderKey = GlobalKey();
//   double _dx = 0;
//   double _maxDx = 0;
//   double get _progress => _dx == 0 ? 0 : _dx / _maxDx;

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _calculateMaxDx();
//     });
//   }

//   void _calculateMaxDx() {
//     final RenderBox? containerBox =
//         _containerKey.currentContext?.findRenderObject() as RenderBox?;
//     final RenderBox? sliderBox =
//         _sliderKey.currentContext?.findRenderObject() as RenderBox?;

//     if (containerBox != null && sliderBox != null) {
//       setState(() {
//         _maxDx = containerBox.size.width - sliderBox.size.width - 8;
//       });
//     }
//   }

//   void onHorizontalDragUpdate(DragUpdateDetails details) {
//     if (_maxDx > 0) {
//       setState(() {
//         _dx = (_dx + details.delta.dx).clamp(0.0, _maxDx);
//       });
//     }
//   }

//   void _cancelAnimation() {
//     setState(() {
//       _dx = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: _containerKey,
//       height: 50,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Color(0xffEBEBEB),
//         borderRadius: BorderRadius.circular(35),
//       ),
//       child: Stack(
//         alignment: Alignment.centerLeft,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//              // SvgPicture.asset(AppImages.buttonarrorIcon),
//                2.w.width],
//           ),
//           Positioned(
//             left: 4 + _dx,
//             child: GestureDetector(
//               key: _sliderKey,
//               onHorizontalDragUpdate: onHorizontalDragUpdate,
//               onHorizontalDragEnd: (details) {
//                 if (_progress >= 0.8 && widget.onSubmit != null) {
//                   widget.onSubmit!();
//                 }
//                 _cancelAnimation();
//               },
//               child: Container(
//                 height: 42,

//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(21),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12),
//                   child: Center(
//                     child: Text(
//                       widget.text,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
