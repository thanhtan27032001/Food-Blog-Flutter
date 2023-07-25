part of 'add_recipe_controller.dart';

class AddRecipePage extends GetView<AddRecipeController> {
  AddRecipePage({super.key});

  @override
  final controller = Get.put(AddRecipeController());

  static void open() {
    Get.toNamed('AddRecipePage');
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        statusBarColor: AppColors.whiteColor(),
        appbar: AppBarWidget(
          title: 'Công thức mới',
          titleColor: AppColors.blackColor(),
          isCenterTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            color: AppColors.blackColor(),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.save_outlined),
              color: AppColors.blackColor(),
              onPressed: () {},
            )
          ],
          backgroundColor: AppColors.whiteColor(),
        ).build(context),
        pageBackgroundColor: AppColors.whiteColor(),
        pageBody: _body(context));
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                controller.pickImage(context);
              },
              child: Obx(() {
                if (controller.imageUrl.value != null) {
                  return Image.file(
                    File(controller.imageUrl.value!),
                    width: double.infinity,
                    height: 240,
                    fit: BoxFit.cover,
                  );
                }
                return Container(
                  width: double.infinity,
                  height: 240,
                  color: AppColors.grayColor(level: 2),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
