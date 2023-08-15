part of 'archived_recipe_controller.dart';

class ArchivedRecipePage extends GetView<ArchivedRecipeController> {
  ArchivedRecipePage({super.key});

  @override
  final controller = Get.put(ArchivedRecipeController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: Colors.white10,
      appbar: AppBarWidget(
        title: 'Công thức đã lưu trữ',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: AppColors.whiteColor(),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          AppIconButtonWidget(
            icon: const Icon(Icons.refresh, color: Colors.white,),
            onPressed: () {
              controller.getMyArchivedRecipeList();
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
        if (controller.myArchivedRecipeList.value != null) {
          return RefreshIndicator(
            onRefresh: controller.getMyArchivedRecipeList,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Wrap(
                  children: List.generate(
                    controller.myArchivedRecipeList.value!.length,
                        (index) => FractionallySizedBox(
                      widthFactor: 0.5,
                      child: LayoutBuilder(
                        builder: (context, constraints) => Padding(
                          padding: const EdgeInsets.all(2),
                          child: GestureDetector(
                            onTap: () {
                              controller.gotoRecipeDetail(index);
                            },
                            child: MyRecipePreviewCardWidget(
                              controller.myArchivedRecipeList.value![index],
                              optionList: (BuildContext context) =>
                              <PopupMenuEntry>[
                                PopupMenuItem(
                                  onTap: () {
                                    controller.revertRecipe(index);
                                  },
                                  child: AppTextBody1Widget()
                                      .setText('Khôi phục')
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
            ),
          );
        } else {
          return const AppLoadingWidget().build(context);
        }
      },
    );
  }
}
