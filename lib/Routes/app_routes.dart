import 'package:e_learning/View/Auth/forget_password.dart';
import 'package:e_learning/View/Auth/sign_in.dart';
import 'package:e_learning/View/Auth/sign_up.dart';
import 'package:e_learning/View/Drafts/draftsPage.dart';
import 'package:e_learning/View/Premium/premium.dart';
import 'package:e_learning/View/Profile/history_page.dart';
import 'package:e_learning/View/SplashOnboarding/splash.dart';
import 'package:e_learning/core/common/bottomAppBar/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/SplashScreen';
  static const String signInPage = '/SignInPage';
  static const String signUpPage = '/SignUpPage';
  static const String forgetPassword = '/ForgetPassword';
  static const String premiumPage = '/PremiumPage';
  static const String bottomAppBarScreen = '/BottomAppBarScreen';
  static const String draftsPage = '/DraftsPage';
  static const String historyPage = '/HistoryPage';
  // static const String gymGPTScreen = '/GymGPTScreen';
  // static const String journalScreen = '/JournalScreen';
  // static const String workoutSchedule = '/WorkoutSchedule';
  // static const String myPerformance = '/MyPerformance';
  // static const String profileScreen = '/ProfileScreen';
  // static const String createWorkoutChatPage = '/CreateWorkoutChatPage';
  // static const String signUpPage = '/SignUpPage';
  // static const String welcomePage = '/WelcomePage';
  // static const String onboarding = '/Onboarding';
  // static const String testScreenText = '/TestScreenText';
  // static const String testScreenText = '/TestScreenText';

  static Map<String, WidgetBuilder> get routes => {
    splashScreen: (_) => SplashScreen(),
    signInPage: (_) => SignInPage(), ////HomeWidgetExample(), //
    signUpPage: (_) => SignUpPage(),
    forgetPassword: (_) => ForgetPassword(),
    premiumPage: (_) => PremiumPage(),
    bottomAppBarScreen: (_) => BottomAppBarScreen(),
    draftsPage: (_) => DraftsPage(),
    historyPage: (_) => HistoryPage(),
    // gymGPTScreen: (_) => GymGPTScreen(),
    // journalScreen: (_) => JournalScreen(),
    // workoutSchedule: (_) => WorkoutSchedule(),
    // myPerformance: (_) => MyPerformance(),
    // profileScreen: (_) => ProfileScreen(),
    // createWorkoutChatPage: (_) => CreateWorkoutChatPage(),
    // forgetPassword: (_) => ForgetPassword(), ////
    // welcomePage: (_) => WelcomePage(),
    // onboarding: (_) => Onboarding(),
  };
}
