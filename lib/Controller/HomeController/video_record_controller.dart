import 'dart:io';
import 'package:camera/camera.dart';
import 'package:e_learning/View/Home/widgets/vide_preview_page.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCameraController extends GetxController {
  CameraController? cameraController;
  var isRecording = false.obs;
  var isInitialized = false.obs;
  var recordedVideoPath = ''.obs;
  var showNextButton = false.obs; // Add this
  List<CameraDescription>? cameras;

  Future<void> initializeCamera() async {
    try {
      // Request permissions
      final cameraStatus = await Permission.camera.request();
      final micStatus = await Permission.microphone.request();

      if (!cameraStatus.isGranted || !micStatus.isGranted) {
        Get.snackbar(
          'Permission Denied',
          'Camera and microphone permissions are required',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Get available cameras
      cameras = await availableCameras();

      if (cameras == null || cameras!.isEmpty) {
        Get.snackbar(
          'Error',
          'No cameras available',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Initialize camera controller
      cameraController = CameraController(
        cameras![0], // Back camera
        ResolutionPreset.high,
        enableAudio: true,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await cameraController!.initialize();
      isInitialized.value = true;
      print('Camera initialized successfully');
    } catch (e) {
      print('Error initializing camera: $e');
      Get.snackbar(
        'Error',
        'Failed to initialize camera: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> startRecording() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      print('Camera not initialized');
      return;
    }

    if (isRecording.value) {
      print('Already recording');
      return;
    }

    try {
      await cameraController!.startVideoRecording();
      isRecording.value = true;
      showNextButton.value = false; // Hide next button when recording
      print('Recording started');
    } catch (e) {
      print('Error starting recording: $e');
      Get.snackbar(
        'Error',
        'Failed to start recording: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> stopRecording() async {
    if (cameraController == null || !isRecording.value) {
      return;
    }

    try {
      final video = await cameraController!.stopVideoRecording();
      isRecording.value = false;
      recordedVideoPath.value = video.path;
      showNextButton.value = true; // Show next button after recording

      print('Video saved at: ${video.path}');

      Get.snackbar(
        'Success',
        'Video recorded successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    } catch (e) {
      print('Error stopping recording: $e');
      Get.snackbar(
        'Error',
        'Failed to stop recording: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void goToVideoPreview() {
    if (recordedVideoPath.value.isNotEmpty) {
      Get.to(() => VideoPreviewScreen(videoPath: recordedVideoPath.value));
    }
  }

  Future<void> switchCamera() async {
    if (cameras == null || cameras!.length < 2) {
      return;
    }

    try {
      final currentCamera = cameraController!.description;
      final newCamera = cameras!.firstWhere(
        (camera) => camera.lensDirection != currentCamera.lensDirection,
      );

      isInitialized.value = false;
      await cameraController!.dispose();

      cameraController = CameraController(
        newCamera,
        ResolutionPreset.high,
        enableAudio: true,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await cameraController!.initialize();
      isInitialized.value = true;
    } catch (e) {
      print('Error switching camera: $e');
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
