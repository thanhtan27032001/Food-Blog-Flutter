part of 'recipe_management_controller.dart';

class RecipeManagementPage extends GetView<RecipeManagementController> {
  RecipeManagementPage({super.key});

  @override
  final controller = Get.put(RecipeManagementController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: Colors.white10,
      appbar: AppBarWidget(
        title: 'Quản lý công thức',
        actions: [
          IconButton(
            onPressed: () async {
              controller.gotoAddRecipePage();
            },
            icon: const Icon(Icons.add_circle_outline_rounded),
          )
        ],
      ).build(context),
      pageBody: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Obx(
      () {
        if (controller.myRecipeList.value != null) {
          return RefreshIndicator(
            onRefresh: controller.getMyRecipeList,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                                  controller.changeRecipeStatus(index);
                                },
                                child: AppTextBody1Widget()
                                    .setText(controller.myRecipeList
                                                .value?[index].status ==
                                            RecipeStatus.public.value
                                        ? 'Lưu nháp'
                                        : 'Công khai')
                                    .build(context),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  controller.archiveRecipe(index);
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
            ),
          );
        } else {
          return const AppLoadingWidget().build(context);
        }
      },
    );
  }
}
