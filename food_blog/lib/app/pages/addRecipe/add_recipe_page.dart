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
        statusBarColor: AppColors.primaryColor(level: 2),
        appbar: AppBarWidget(
          title: 'Công thức mới',
          titleColor: AppColors.whiteColor(),
          isCenterTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            color: AppColors.whiteColor(),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.save_outlined),
              color: AppColors.whiteColor(),
              onPressed: () {
                controller.showDialogAddRecipe(context);
              },
            )
          ],
          backgroundColor: AppColors.primaryColor(level: 2),
        ).build(context),
        pageBackgroundColor: Colors.white10,
        pageBody: _body(context));
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.scrollController,
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
                  return Center(
                    child: Image.asset(
                      'assets/images/pick_image.png',
                      height: 100,
                      fit: BoxFit.cover,
                      color: AppColors.grayColor(level: 3),
                    ),
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
              onChange: (value) {
                controller.newRecipe.title = value;
              },
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
              onChange: (value) {
                controller.newRecipe.description = value;
              },
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
              inputType: const TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              onChange: (value) {
                controller.newRecipe.serveNum =
                    value.trim() != '' ? int.parse(value) : null;
              },
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
                    inputType: const TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    onChange: (value) {
                      controller.newRecipe.prepareTime =
                          value.trim() != '' ? int.parse(value) : null;
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppCornerCardTextFieldWidget(
                    borderRadius: 6,
                    elevation: 2,
                    hintText: 'Thực hiện',
                    inputType: const TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    onChange: (value) {
                      controller.newRecipe.cookTime =
                          value.trim() != '' ? int.parse(value) : null;
                    },
                  ),
                ),
              ],
            ),

            // ingredients
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
                          message:
                              'Bạn có thể vuốt sang trái để xóa nguyên liệu',
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
                          child: AppCornerCardTextFieldWidget(
                            borderRadius: 6,
                            elevation: 2,
                            hintText: '1 quả cà chua',
                            text: controller
                                .ingredientList.value[index].description,
                            onChange: (value) {
                              controller.updateIngredient(index, value);
                            },
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
            ),

            // steps
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
                                  'Thực hiện (${controller.stepList.value.length})')
                              .setTextStyle(
                                  const TextStyle(fontWeight: FontWeight.bold))
                              .build(context),
                        ),
                        const Spacer(),
                        Tooltip(
                          message:
                              'Bạn có thể vuốt sang trái để xóa bước thực hiện',
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
                      itemCount: controller.stepList.value.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ObjectKey(controller.stepList.value[index]),
                          onDismissed: (details) {
                            controller.removeStep(context, index);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 4, top: index > 0 ? 16 : 0),
                                child: AppTextBody2Widget()
                                    .setText(
                                        'Bước ${controller.stepList.value[index].index}')
                                    .build(context),
                              ),
                              AppCornerCardTextFieldWidget(
                                borderRadius: 6,
                                elevation: 2,
                                hintText: 'Mô tả bước thực hiện của bạn',
                                text: controller
                                    .stepList.value[index].description,
                                onChange: (value) {
                                  controller.updateStep(index, value);
                                },
                              ).build(context),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                elevation: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickStepImage(context, index);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: controller.stepList.value[index]
                                                .imageUrl !=
                                            null
                                        ? Image.file(
                                            File(controller.stepList
                                                .value[index].imageUrl!),
                                            width: double.infinity,
                                            fit: BoxFit.cover)
                                        : Container(
                                            width: double.infinity,
                                            height: 100,
                                            color:
                                                AppColors.whiteColor(),
                                            child: Center(
                                              child: AppTextBody3Widget()
                                                  .setText(
                                                      'Ảnh hướng dẫn\n- Không bắt buộc -')
                                                  .setTextAlign(
                                                      TextAlign.center)
                                                  .build(context),
                                            ),
                                          ),
                                  ),
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
                    .setText('Thêm bước thực hiện')
                    .setColor(AppColors.whiteColor())
                    .build(context),
                onPressed: () {
                  controller.addStep();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
