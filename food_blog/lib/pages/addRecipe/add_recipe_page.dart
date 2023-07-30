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
            Container(
              margin: const EdgeInsets.only(left: 2, top: 32, bottom: 8),
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
            Container(
              margin: const EdgeInsets.only(left: 2, top: 32, bottom: 8),
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
            Container(
              margin: const EdgeInsets.only(left: 2, top: 32, bottom: 8),
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
            Container(
              margin: const EdgeInsets.only(left: 2, top: 32, bottom: 8),
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

            // ingredients
            // const SizedBox(height: 16),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 2, top: 32, bottom: 8),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 2),
                          child: AppTextBody2Widget()
                              .setText(
                                  'Nguyên liệu (${controller.ingredientList.value.length})')
                              .setTextStyle(
                                  const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                        ),
                        const Spacer(),
                        Tooltip(
                          message: 'Bạn có thể vuốt sang trái để xóa nguyên liệu',
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: AppColors.secondaryColor(level: 2),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: controller.ingredientList.value.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key:
                              ObjectKey(controller.ingredientList.value[index]),
                          onDismissed: (details) {
                            controller.removeIngredient(context, index);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: AppCornerCardTextFieldWidget(
                                  borderRadius: 6,
                                  elevation: 2,
                                  hintText: 'Cà chua',
                                  text: controller
                                      .ingredientList.value[index].name,
                                  onChange: (value) {
                                    controller.updateIngredient(
                                        index, value, null);
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: AppCornerCardTextFieldWidget(
                                  borderRadius: 6,
                                  elevation: 2,
                                  hintText: '1 quả',
                                  text: controller.ingredientList.value[index]
                                      .numberDescription,
                                  onChange: (value) {
                                    controller.updateIngredient(
                                        index, null, value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Center(
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.primaryColor()),
                ),
                child: AppTextBody2Widget()
                    .setText('Thêm nguyên liệu')
                    .setColor(AppColors.whiteColor())
                    .build(context),
                onPressed: () {
                  controller.addIngredient();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
