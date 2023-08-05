part of 'recipe_management_controller.dart';

class RecipeManagementPage extends GetView<RecipeManagementController> {
  RecipeManagementPage({super.key});

  @override
  final controller = Get.put(RecipeManagementController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
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
    return const SingleChildScrollView(
      child: Column(
        children: [

        ],
      ),
    );
  }
}
