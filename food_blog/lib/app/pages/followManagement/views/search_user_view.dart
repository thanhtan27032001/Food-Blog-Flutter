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
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: index % 2 == 0 ? AppColors.grayColor(level: 0) : AppColors.whiteColor()
              ),
              child: Row(
                children: [
                  AppAvatarWidget(
                      avtUrl: controller.searchedUserList[index].avatarUrl, size: 32),
                  const SizedBox(width: 8,),
                  AppTextBody2Widget().setText(
                      controller.searchedUserList[index]
                          .nickname).build(context),
                  const Spacer(),
                  AppFollowButtonWidget(
                    onPressed: () {},
                  ).build(context)
                ],
              ),
            );
          },
        )
      ],
    );
  }
}