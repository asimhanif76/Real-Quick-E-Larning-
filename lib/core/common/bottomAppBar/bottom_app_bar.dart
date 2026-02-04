import 'package:e_learning/View/Drafts/draftsPage.dart';
import 'package:e_learning/View/Home/home.dart';
import 'package:e_learning/View/Profile/profile_home.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:e_learning/core/common/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/custamContainer.dart';

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({super.key});

  @override
  State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomePage(),
      DraftsPage(), ProfileHome(),
      // HomeScreen(),
      // JournalScreen(),
      // GymGPTScreen(),
      // MyPerformance(),
      // ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomContainer(
        height: double.infinity,
        width: double.infinity,
        imageDecoration: DecorationImage(
          image: AssetImage(AppImages.background),
          fit: BoxFit.cover,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 7.h,
              child: Center(child: screens[_selectedIndex]),
            ),

            Positioned(
              bottom: 3.5.h,
              left: 3.w,
              right: 3.w,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: GlassContainer(
                  showBorder: false,
                  borderRadius: 90,
                  child: CustomContainer(
                    height: 9.h,

                    // color: AppColors.white,
                    circular: 290,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildNavItem(0, AppImages.home, 'Home'),
                          _buildNavItem(1, AppImages.drafts, 'Drafts'),
                          _buildNavItem(2, AppImages.profile, 'Me'),
                          // _buildNavItem(3, AppImages.chart),
                          // _buildNavItem(4, AppImages.user),
                        ],
                      ),
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

  /// Builds a single bottom nav item
  Widget _buildNavItem(int index, String iconPath, String title) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: CustomContainer(
        height: 8.h,
        width: 100,
        circular: 35,
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              color: isSelected ? AppColors.white : AppColors.black54,
            ),
            CustomTextWidget(
              title: title,
              color: isSelected ? AppColors.white : AppColors.black54,
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:e_learning/View/Home/home.dart';
// import 'package:e_learning/core/common/app_text.dart';
// import 'package:e_learning/core/common/utils/Themes/app_color.dart';
// import 'package:e_learning/core/common/utils/app_images.dart';
// import 'package:e_learning/core/common/widgets/glass_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../widgets/custamContainer.dart';

// class BottomAppBarScreen extends StatefulWidget {
//   const BottomAppBarScreen({super.key});

//   @override
//   State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
// }

// class _BottomAppBarScreenState extends State<BottomAppBarScreen>
//     with SingleTickerProviderStateMixin {
//   int _selectedIndex = 0;
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 400),
//       vsync: this,
//     );
//     _updateAnimation();
//     _controller.forward();
//   }

//   void _updateAnimation() {
//     _animation = Tween<double>(begin: 0.0, end: _selectedIndex.toDouble())
//         .animate(
//           CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
//         );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _onItemTapped(int index) {
//     if (_selectedIndex != index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//       _controller.reset();
//       _updateAnimation();
//       _controller.forward();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> screens = [
//       HomePage(),
//       Center(child: Text("Drafts Screen", style: TextStyle(fontSize: 24))),
//       Center(child: Text("Profile Screen", style: TextStyle(fontSize: 24))),
//     ];

//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: CustomContainer(
//         height: double.infinity,
//         width: double.infinity,
//         imageDecoration: DecorationImage(
//           image: AssetImage(AppImages.background),
//           fit: BoxFit.cover,
//         ),
//         child: Stack(
//           children: [
//             // Centered screen content
//             Positioned.fill(
//               child: Center(
//                 child: AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 300),
//                   child: Container(
//                     key: ValueKey<int>(_selectedIndex),
//                     child: screens[_selectedIndex],
//                   ),
//                 ),
//               ),
//             ),

//             // Bottom Navigation Bar
//             Positioned(
//               bottom: 3.5.h,
//               left: 3.w,
//               right: 3.w,
//               child: GlassContainer(
//                 showBorder: false,
//                 borderRadius: 90,
//                 child: Container(
//                   height: 9.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(90),
//                   ),
//                   child: Stack(
//                     children: [
//                       // Sliding indicator background
//                       AnimatedBuilder(
//                         animation: _animation,
//                         builder: (context, child) {
//                           return Positioned(
//                             left: _calculatePosition(),
//                             top: 0,
//                             bottom: 0,
//                             child: Container(
//                               width: 110,
//                               margin: EdgeInsets.symmetric(vertical: 0.8.h),
//                               decoration: BoxDecoration(
//                                 color: AppColors.primaryColor,
//                                 borderRadius: BorderRadius.circular(35),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: AppColors.primaryColor.withOpacity(
//                                       0.3,
//                                     ),
//                                     blurRadius: 12,
//                                     offset: Offset(0, 4),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),

//                       // Navigation items
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 2.w),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             _buildNavItem(0, AppImages.home, 'Home'),
//                             _buildNavItem(1, AppImages.drafts, 'Drafts'),
//                             _buildNavItem(2, AppImages.profile, 'Me'),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   double _calculatePosition() {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final availableWidth = screenWidth - (6.w * 2) - (4.w);
//     final itemWidth = availableWidth / 3;
//     return 2.w + (itemWidth * _animation.value) + (itemWidth / 2) - 55;
//   }

//   Widget _buildNavItem(int index, String iconPath, String title) {
//     final isSelected = _selectedIndex == index;

//     return GestureDetector(
//       onTap: () => _onItemTapped(index),
//       child: Container(
//         width: 110,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//               child: SvgPicture.asset(
//                 iconPath,
//                 height: 24,
//                 width: 24,
//                 color: isSelected ? AppColors.white : AppColors.black54,
//               ),
//             ),
//             SizedBox(height: 4),
//             AnimatedDefaultTextStyle(
//               duration: const Duration(milliseconds: 300),
//               style: TextStyle(
//                 color: isSelected ? AppColors.white : AppColors.black54,
//               ),
//               child: CustomTextWidget(
//                 title: title,
//                 color: isSelected ? AppColors.white : AppColors.black54,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
