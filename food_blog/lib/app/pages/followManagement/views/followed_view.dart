part of '../follow_management_controller.dart';

class FollowedView extends GetView<FollowManagementController> {
  FollowedView({super.key});

  @override
  final controller = Get.put(FollowManagementController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.myFollowedList.length,
        itemBuilder: (context, index) {
          return UserInfoCardWidget(
            controller.myFollowedList[index],
            onCardPressed: () {
              Get.to(() => UserWallPage(),
                  arguments: controller.myFollowedList[index].id);
            },
            onFollowButtonPressed: () {
              controller.changeFollowStatusFollowedList(index);
            },
          ).build(context);
        },
      );
    });
  }
}
