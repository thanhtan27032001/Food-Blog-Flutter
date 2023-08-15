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
          onRefresh: controller.getMyRecipeList,
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
                    .setText(UserData.instance().getUserLogin()?.email)
                    .setColor(AppColors.grayColor(level: 2))
                    .build(context),
                const SizedBox(height: 4),
                FilledButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)))),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor()),
                  ),
                  child: AppTextBody2Widget().setText('Theo dõi').build(context),
                ),
                const SizedBox(height: 32,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          AppTextBody2Widget().setText('xxx').build(context),
                          const SizedBox(
                            height: 4,
                          ),
                          AppTextBody2Widget()
                              .setText('Công thức')
                              .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                        ],
                      ),
                      Column(
                        children: [
                          AppTextBody2Widget().setText('xxx').build(context),
                          const SizedBox(
                            height: 4,
                          ),
                          AppTextBody2Widget()
                              .setText('Người theo dõi')
                              .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                        ],
                      ),
                      Column(
                        children: [
                          AppTextBody2Widget().setText('xxx').build(context),
                          const SizedBox(
                            height: 4,
                          ),
                          AppTextBody2Widget()
                              .setText('Đang theo dõi')
                              .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                  child: const Divider(thickness: 1, height: 0),
                ),
                Obx(
                      () {
                    if (controller.myFavoriteRecipeList.value != null) {
                      return SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Wrap(
                            children: List.generate(
                              controller.myFavoriteRecipeList.value!.length,
                                  (index) => FractionallySizedBox(
                                widthFactor: 0.5,
                                child: LayoutBuilder(
                                  builder: (context, constraints) => Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: RecipePreviewCardLv2Widget(
                                      controller.myFavoriteRecipeList.value![index],
                                      onPressed: () => controller.gotoRecipeDetail(index),
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
                          const SizedBox(height: 32,),
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
