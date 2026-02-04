import 'package:e_learning/Model/on_boarding_model.dart';
import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final RxInt currentPage = 0.obs;

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: "Video Creating & Editing",
      description: "Create and edit videos with precision and ease.",
      image: AppImages.onboarding_1,
      smallImage: AppImages.bgImage_1,
    ),
    OnboardingModel(
      title: "Audio & AI-Voiceover",
      description: "Seamless audio recording and voice-over editing",
      image: AppImages.onboarding_2,
      smallImage: AppImages.bgImage_2,
    ),
    OnboardingModel(
      title: "Generate auto Captions",
      description: "Instant caption generation for your videos",
      image: AppImages.onboarding_3,
      smallImage: AppImages.bgImage_3,
    ),
  ];
}
