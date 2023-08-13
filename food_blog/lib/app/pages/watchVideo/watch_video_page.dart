part of 'watch_video_controller.dart';

class WatchVideoPage extends GetView<WatchVideoController> {
  WatchVideoPage({super.key});

  @override
  final controller = Get.put(WatchVideoController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: Obx(() {
        if (controller.isVideoInitialized.value == true) {
          return Chewie(controller: controller.chewieController!);
        }
        else {
          return const AppLoadingWidget();
        }
      },),
    );
  }
}
