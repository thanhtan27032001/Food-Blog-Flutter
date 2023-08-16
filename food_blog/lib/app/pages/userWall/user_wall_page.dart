part of 'user_wall_controller.dart';

class UserWallPage extends GetView<UserWallController> {
  UserWallPage({super.key});

  @override
  final controller = Get.put(UserWallController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        statusBarColor: AppColors.primaryColor(level: 2),
        pageBackgroundColor: AppColors.whiteColor(),
        appbar: AppBarWidget(
          title: 'Nguyễn Tân',
          titleColor: AppColors.whiteColor(),
          isCenterTitle: true,
          leading: AppIconButtonWidget(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.whiteColor(),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: AppColors.primaryColor(level: 2),
        ).build(context),
        pageBody: _body(context));
  }

  Widget _body(BuildContext context) {
    return Obx(() {
      if (controller.userModel.value != null) {
        return RefreshIndicator(
          onRefresh: controller.getUserRecipeList,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                AppAvatarWidget(
                  avtUrl: controller.userModel.value?.avatarUrl,
                  size: 120,
                ).build(context),
                const SizedBox(height: 16),
                AppTextBody2Widget()
                    .setText(controller.userModel.value?.email)
                    .setColor(AppColors.grayColor(level: 2))
                    .build(context),
                const SizedBox(height: 4),
                Obx(() {
                  return AppFollowButtonWidget(
                      onPressed: () {
                        controller.changeFollowUser();
                      },
                      isFollowed: controller.isFollowed.value)
                      .build(context);
                }),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          AppTextBody2Widget()
                              .setText(
                                  controller.userModel.value?.numOfRecipe !=
                                          null
                                      ? controller.userModel.value?.numOfRecipe
                                          .toString()
                                      : '0')
                              .build(context),
                          const SizedBox(
                            height: 4,
                          ),
                          AppTextBody2Widget()
                              .setText('Công thức')
                              .setTextStyle(
                                  const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                        ],
                      ),
                      Column(
                        children: [
                          AppTextBody2Widget()
                              .setText(controller
                                          .userModel.value?.numOfFollowed !=
                                      null
                                  ? controller.userModel.value?.numOfFollowed
                                      .toString()
                                  : '0')
                              .build(context),
                          const SizedBox(
                            height: 4,
                          ),
                          AppTextBody2Widget()
                              .setText('Người theo dõi')
                              .setTextStyle(
                                  const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                        ],
                      ),
                      Column(
                        children: [
                          AppTextBody2Widget()
                              .setText(controller
                                          .userModel.value?.numOfFollowing !=
                                      null
                                  ? controller.userModel.value?.numOfFollowing
                                      .toString()
                                  : '0')
                              .build(context),
                          const SizedBox(
                            height: 4,
                          ),
                          AppTextBody2Widget()
                              .setText('Đang theo dõi')
                              .setTextStyle(
                                  const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          AppTextBody2Widget()
                              .setText(controller.userModel.value?.city)
                              .setTextStyle(
                                  const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                        ],
                      ),
                      AppTextBody2Widget()
                          .setText(controller.userModel.value?.intro)
                          .build(context),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: const Divider(thickness: 1, height: 0),
                ),
                Obx(
                  () {
                    if (controller.recipeList.value != null) {
                      return SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Wrap(
                              children: List.generate(
                                controller.recipeList.value!.length,
                                (index) => FractionallySizedBox(
                                  widthFactor: 0.5,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) => Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: RecipePreviewCardLv2Widget(
                                        controller.recipeList.value![index],
                                        onPressed: () =>
                                            controller.gotoRecipeDetail(index),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          const AppLoadingWidget().build(context),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      } else {
        return const Center(child: AppLoadingWidget());
      }
    });
  }
}
