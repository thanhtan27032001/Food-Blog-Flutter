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
      appbar: AppBarWidget(
        title: 'Công thức yêu thích',
        actions: [
          AppIconButtonWidget(
            icon: const Icon(Icons.refresh, color: Colors.white,),
            onPressed: () {
              controller.getMyRecipeList();
            },
          )
        ],
      ).build(context),
      pageBody: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Obx(
      () {
        if (controller.myFavoriteRecipeList.value != null) {
          return RefreshIndicator(
            onRefresh: controller.getMyRecipeList,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
            ),
          );
        } else {
          return AppLoadingWidget().build(context);
        }
      },
    );
  }
}
