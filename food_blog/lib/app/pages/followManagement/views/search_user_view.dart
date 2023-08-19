part of '../follow_management_controller.dart';

class SearchUserView extends GetView<FollowManagementController> {
  const SearchUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: AppTextBody1Widget()
              .setText('Kết quả tìm kiếm')
              .setTextStyle(
                const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
              .build(context),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: controller.searchedUserList.length,
          itemBuilder: (context, index) {
            return UserInfoCardWidget(
              controller.searchedUserList[index],
              onCardPressed: () {
                Get.to(() => UserWallPage(),
                    arguments: controller.searchedUserList[index].id);
              },
              onFollowButtonPressed: () {
                controller.changeFollowStatusSearchList(index);
              },
            ).build(context);
          },
        )
      ],
    );
  }
}
