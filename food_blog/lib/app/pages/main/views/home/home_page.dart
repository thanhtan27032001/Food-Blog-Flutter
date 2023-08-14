part of 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  HomePage({super.key});

  @override
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: Colors.white10,
      pageBody: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // search bar
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.grayColor(level: 0)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColors.grayColor(level: 2),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      AppTextBody1Widget()
                          .setText('Gõ nguyên liệu để tìm')
                          .setTextAlign(TextAlign.start)
                          .setColor(AppColors.grayColor(level: 2))
                          .build(context),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() => controller.ingredientTagList.value != null
                ? HomeSuggestionWithTagListWidget(
                    title: 'Các nguyên liệu đang trong mùa',
                    ingredientTagList: controller.ingredientTagList.value!,
                    recipeList: controller.recipeByIngredientList.value ?? [],
                    onTagPressed: (p0) {
                      controller.getRecipeIngredientTagList(p0);
                    },
                  )
                : AppTextBody1Widget().setText('Đang tải...').build(context)),
            Obx(() => controller.recipeByIngredientList.value != null
                ? (controller.recipeByIngredientList.value!.isNotEmpty
                    ? Container(
                        width: double.infinity,
                        height: 200,
                        margin: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shrinkWrap: true,
                          itemCount:
                              controller.recipeByIngredientList.value!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => RecipeDetailPage(),
                                    arguments: controller.recipeByIngredientList
                                        .value?[index].recipeId);
                              },
                              child: RecipePreviewCardLv2Widget(
                                controller.recipeByIngredientList.value![index],
                                cardWidth: 200,
                                cardHeight: 200,
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          AppTextBody2Widget()
                              .setText('Oh nooo! Không có công thức phù hợp ;(')
                              .build(context)
                        ],
                      ))
                : const AppLoadingWidget().build(context)),

            Obx(
              () => controller.recipePopularList.value != null
                  ? HomeSuggestionWidget(
                      title: 'Các công thức phổ biến',
                      recipeList: controller.recipePopularList.value!,
                    )
                  : const AppLoadingWidget().build(context),
            ),

            // receipt newest suggest
            Obx(
              () => controller.recipeNewestList.value != null
                  ? HomeSuggestionWidget(
                      title: 'Các công thức mới nhất',
                      recipeList: controller.recipeNewestList.value!,
                    )
                  : const AppLoadingWidget().build(context),
            ),
          ],
        ),
      ),
    );
  }
}
