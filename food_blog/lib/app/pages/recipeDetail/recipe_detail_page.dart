part of 'recipe_detail_controller.dart';

class RecipeDetailPage extends GetView<RecipeDetailController> {
  RecipeDetailPage({super.key});

  @override
  final controller = Get.put(RecipeDetailController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: Obx(() {
        if (controller.recipeModel.value != null) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Column(
                children: [
                  // app bar
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: AppColors.primaryColor(),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                          iconSize: 16,
                          color: AppColors.whiteColor(),
                        ),
                        AppTextBody1Widget()
                            .setText(controller.recipeModel.value?.title!)
                            .setTextStyle(
                              const TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                            .build(context),
                        const Spacer(),
                        AppIconButtonWidget(
                          onPressed: () {
                            controller.changeFavoriteStatus();
                          },
                          icon: Icon(
                            controller.recipeModel.value?.favoriteRecipeId !=
                                    null
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: AppColors.whiteColor(),
                          ),
                        )
                      ],
                    ),
                  ),

                  // image
                  Image.network(
                    controller.recipeModel.value?.imageUrl ?? '',
                    fit: BoxFit.fill,
                  ),

                  // author info
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          AppAvatarWidget(
                              avtUrl: controller
                                  .recipeModel.value?.author?.avatarUrl,
                              size: 48,
                              onPress: () {}),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextBody2Widget()
                                    .setText(controller
                                        .recipeModel.value?.author?.nickname)
                                    .setTextStyle(const TextStyle(
                                        fontWeight: FontWeight.bold))
                                    .build(context),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time,
                                        size: 16,
                                        color: AppColors.grayColor(level: 2)),
                                    const SizedBox(width: 4),
                                    AppTextBody2Widget()
                                        .setText(controller
                                            .recipeModel.value?.updateDate
                                            ?.toString())
                                        .setColor(AppColors.grayColor(level: 2))
                                        .build(context),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AppRecipeExpansion(
                      description: controller.recipeModel.value!.description!,
                    ),
                  ),

                  // summary cards
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RecipeSummaryCard(
                            icon: SvgPicture.asset(
                                'assets/svgs/meal_serving.svg'),
                            title: 'Khẩu phần',
                            body:
                                '${controller.recipeModel.value?.serveNum} người'),
                        RecipeSummaryCard(
                            icon: SvgPicture.asset(
                                'assets/svgs/prepare_time.svg'),
                            title: 'Chuẩn bị',
                            body:
                                '${controller.recipeModel.value?.prepareTime} phút'),
                        RecipeSummaryCard(
                            icon: SvgPicture.asset('assets/svgs/cook_time.svg'),
                            title: 'Thực hiện',
                            body:
                                '${controller.recipeModel.value?.cookTime} phút'),
                      ],
                    ),
                  ),

                  // ingredient list
                  const SizedBox(
                    height: 64,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RecipeIngredientListWidget(
                      ingredientList:
                          controller.recipeModel.value!.ingredientList!,
                    ),
                  ),

                  // step list
                  const SizedBox(
                    height: 64,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RecipeStepWidget(
                        recipeStepList:
                            controller.recipeModel.value!.stepList!),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    child: const Divider(
                      thickness: 1,
                    ),
                  ),

                  // add comment button
                  FilledButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.add_comment_rounded,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        AppTextBody2Widget()
                            .setText('Thêm bình luận')
                            .build(context),
                      ],
                    ),
                  ),

                  // comments
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: RecipeReactWidget(
                        controller.commentList, controller.recipeModel.value!),
                  )
                ],
              ),
            ),
          );
        }
        return const AppLoadingWidget().build(context);
      }),
    );
  }
}
