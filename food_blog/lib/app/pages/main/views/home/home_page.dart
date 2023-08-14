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

            //
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
                        child: HomeSuggestionWidget(
                          recipeList: controller.recipeByIngredientList.value!,
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

            // popular recipe
            Container(
              margin: const EdgeInsets.fromLTRB(16, 40, 16, 16),
              child: Row(
                children: [
                  AppTextBody2Widget()
                  .setText('Các công thức phổ biến')
                  .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                  .build(context),
                  GestureDetector(onTap: controller.getRecipePopularList, child: const Icon(Icons.refresh, size: 20,)),
                ],
              ),
            ),
            Obx(
              () => controller.recipePopularList.value != null
                  ? HomeSuggestionWidget(
                      recipeList: controller.recipePopularList.value!,
                    )
                  : const AppLoadingWidget().build(context),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(16, 40, 16, 16),
              child: Row(
                children: [
                  AppTextBody2Widget()
                      .setText('Các công thức mới')
                      .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                      .build(context),
                  GestureDetector(onTap: controller.getRecipeNewestList, child: const Icon(Icons.refresh, size: 20,)),
                ],
              ),
            ),
            Obx(
                  () => controller.recipeNewestList.value != null
                  ? HomeSuggestionWidget(
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
