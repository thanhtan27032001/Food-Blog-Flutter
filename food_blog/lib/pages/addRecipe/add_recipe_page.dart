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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image demo
            GestureDetector(
              onTap: () {
                controller.pickRecipeImage(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Obx(() {
                  if (controller.imageUrl.value != null) {
                    return Image.file(
                      File(controller.imageUrl.value!),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }
                  return Image.asset(
                    'assets/images/pick_image.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),

            // title
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(left: 2),
              child: AppTextBody2Widget()
                  .setText('Tên công thức')
                  .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                  .build(context),
            ),
            AppCornerCardTextFieldWidget(
              borderRadius: 6,
              elevation: 2,
              backgroundColor: AppColors.whiteColor(),
              hintText: 'Vd: Gà nướng, beefsteak...',
              onChange: (value) {},
            ),

            // description
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(left: 2),
              child: AppTextBody2Widget()
                  .setText('Mô tả công thức')
                  .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                  .build(context),
            ),
            AppCornerCardTextFieldWidget(
              borderRadius: 6,
              elevation: 2,
              backgroundColor: AppColors.whiteColor(),
              hintText:
                  'Nêu lên ý tưởng tạo ra công thức, điều gì mang lại cảm hứng cho bạn,...',
              maxLine: 5,
              inputType: TextInputType.multiline,
              onChange: (value) {},
            ),

            // estimate served people
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(left: 2),
              child: AppTextBody2Widget()
                  .setText('Khẩu phần (người)')
                  .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                  .build(context),
            ),
            AppCornerCardTextFieldWidget(
              borderRadius: 6,
              elevation: 2,
              hintText: 'Vd: 1',
              onChange: (value) {},
            ),

            // estimate time
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(left: 2),
              child: AppTextBody2Widget()
                  .setText('Thời gian ước tính (phút)')
                  .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                  .build(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: AppCornerCardTextFieldWidget(
                    borderRadius: 6,
                    elevation: 2,
                    hintText: 'Chuẩn bị',
                    onChange: (value) {},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppCornerCardTextFieldWidget(
                    borderRadius: 6,
                    elevation: 2,
                    hintText: 'Thực hiện',
                    onChange: (value) {},
                  ),
                ),
              ],
            ),

            // estimate time
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(left: 2),
              child: AppTextBody2Widget()
                  .setText('Nguyên liệu')
                  .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                  .build(context),
            ),
            SizedBox(
              width: double.infinity,
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.ingredientCount.value,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(controller.ingredientList[index].id),
                      onDismissed: (direction) {
                        // controller.removeIngredient(controller.ingredientList[index].id);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "${controller.ingredientList[index].id} dismissed")));
                      },
                      background: Container(color: Colors.red),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: AppCornerCardTextFieldWidget(
                              borderRadius: 6,
                              elevation: 2,
                              hintText: 'Cà chua',
                              text: controller.ingredientList[index].id,
                              onChange: (value) {
                                controller.updateIngredient(index, value, null);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: AppCornerCardTextFieldWidget(
                              borderRadius: 6,
                              elevation: 2,
                              hintText: '1 quả',
                              text: controller
                                  .ingredientList[index].numberDescription,
                              onChange: (value) {
                                controller.updateIngredient(index, null, value);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),

            const SizedBox(height: 16),
            AppFilledCornerButtonWidget(
              text: 'Thêm nguyên liệu',
              textColor: AppColors.whiteColor(),
              buttonColor: AppColors.primaryColor(),
              onPressed: () {
                controller.addIngredient();
              },
            )
          ],
        ),
      ),
    );
  }
}
