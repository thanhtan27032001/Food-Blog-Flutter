part of 'favorite_recipe_controller.dart';

class FavoriteRecipePage extends GetView<FavoriteRecipeController> {
  FavoriteRecipePage({super.key});

  @override
  final controller = Get.put(FavoriteRecipeController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: Colors.white10,
      appbar: const AppBarWidget(
        title: 'Công thức yêu thích',
      ).build(context),
      pageBody: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Obx(
      () {
        if (controller.myRecipeList.value != null) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Wrap(
                children: List.generate(
                  controller.myRecipeList.value!.length,
                  (index) => FractionallySizedBox(
                    widthFactor: 0.5,
                    child: LayoutBuilder(
                      builder: (context, constraints) => Padding(
                        padding: const EdgeInsets.all(2),
                        child: MyRecipePreviewCardWidget(
                          controller.myRecipeList.value![index],
                          optionList: (BuildContext context) =>
                              <PopupMenuEntry>[
                            PopupMenuItem(
                              onTap: () {
                                controller.editRecipe(index);
                              },
                              child: AppTextBody1Widget()
                                  .setText('Chỉnh sửa')
                                  .build(context),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                controller.editRecipe(index);
                              },
                              child: AppTextBody1Widget()
                                  .setText(controller.myRecipeList.value?[index]
                                              .status ==
                                          RecipeStatus.public.value
                                      ? 'Lưu nháp'
                                      : 'Công khai')
                                  .build(context),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                controller.editRecipe(index);
                              },
                              child: AppTextBody1Widget()
                                  .setText('Lưu trữ')
                                  .build(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const AppLoadingWidget().build(context);
        }
      },
    );
  }
}
