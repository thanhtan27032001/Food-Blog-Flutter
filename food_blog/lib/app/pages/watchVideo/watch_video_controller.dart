import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/app/components/loading/app_loading_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

part 'watch_video_page.dart';

class WatchVideoController extends GetxController {
  String? videoUrl;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  RxBool isVideoInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    videoUrl = Get.arguments;
    if (videoUrl != null) {
      initVideoController();
    }
  }


  @override
  void onClose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
  }

  Future<void> initVideoController() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl!))..initialize().then((value) {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
      );
      isVideoInitialized.value = true;
      return null;
    });
  }
}