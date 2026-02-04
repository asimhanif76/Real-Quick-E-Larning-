import 'package:e_learning/core/common/utils/app_images.dart';
import 'package:get/get.dart';

class DraftsController extends GetxController {
  // Observable list of drafts
  var draftsList = <DraftModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDrafts();
  }

  void loadDrafts() {
    // Sample draft data
    draftsList.value = [
      DraftModel(
        id: '1',
        thumbnailPath: 'assets/images/draft_1.jpg',
        timestamp: '1 day ago',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      DraftModel(
        id: '2',
        thumbnailPath: 'assets/images/draft_2.jpg',
        timestamp: '1 day ago',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      DraftModel(
        id: '3',
        thumbnailPath: 'assets/images/draft_3.jpg',
        timestamp: '1 day ago',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      DraftModel(
        id: '4',
        thumbnailPath: 'assets/images/draft_4.jpg',
        timestamp: '1 day ago',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      DraftModel(
        id: '5',
        thumbnailPath: 'assets/images/draft_5.jpg',
        timestamp: '1 day ago',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      DraftModel(
        id: '6',
        thumbnailPath: 'assets/images/draft_6.jpg',
        timestamp: '1 day ago',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      DraftModel(
        id: '7',
        thumbnailPath: 'assets/images/draft_7.jpg',
        timestamp: '1 day ago',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      DraftModel(
        id: '8',
        thumbnailPath: 'assets/images/draft_8.jpg',
        timestamp: '1 day ago',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
    ];
  }

  void deleteDraft(String id) {
    draftsList.removeWhere((draft) => draft.id == id);
    Get.snackbar(
      'Draft Deleted',
      'Draft has been removed successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void editDraft(String id) {
    // Navigate to edit screen or perform edit action
    print('Editing draft: $id');
  }
}

class DraftModel {
  final String id;
  final String thumbnailPath;
  final String timestamp;
  final DateTime createdAt;

  DraftModel({
    required this.id,
    required this.thumbnailPath,
    required this.timestamp,
    required this.createdAt,
  });
}
