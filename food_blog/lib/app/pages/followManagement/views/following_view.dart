part of '../follow_management_controller.dart';

class FollowingView extends GetView<FollowManagementController> {
  FollowingView({super.key});

  @override
  final controller = Get.put(FollowManagementController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: controller.getMyFollowingList,
        child: ListView.builder(
          itemCount: controller.myFollowingList.length,
          itemBuilder: (context, index) {
            return UserInfoCardWidget(
              controller.myFollowingList[index],
              onCardPressed: () {
                Get.to(() => UserWallPage(),
                    arguments: controller.myFollowingList[index].id);
              },
              onFollowButtonPressed: () {
                controller.changeFollowStatusFollowingList(index);
              },
            ).build(context);
          },
        ),
      );
    });
  }
}
