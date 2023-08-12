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
    return Stack(
      children: [
        AppMainPageWidget(
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
            pageBody: _body(context)),
        Obx(() {
          if (controller.isSearchingIngredient.value == true) {
            return const SearchIngredientTagView();
          }
          else {
            return const SizedBox();
          }
        })
      ],
    );
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
            Container(
              margin: const EdgeInsets.only(left: 2, top: 8, bottom: 8),
              child: AppTextBody2Widget()
                  .setText('Ảnh công thức*')
                  .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                  .build(context),
            ),
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

            // video
            Container(
              margin: const EdgeInsets.only(left: 2, top: 32, bottom: 8),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: AppTextBody2Widget()
                        .setText(
                        'Video hướng dẫn')
                        .setTextStyle(
                        const TextStyle(fontWeight: FontWeight.bold))
                        .build(context),
                  ),
                  const Spacer(),
                  Obx(() {
                    if (controller.isVideoInitialized.value == false) {
                      return InkWell(
                        onTap: () {
                          controller.pickRecipeVideo(context);
                        },
                        child: const Icon(
                            Icons.add_circle_outline_rounded
                        ),
                      );
                    }
                    else {
                      return InkWell(
                        onTap: () {
                          controller.removeRecipeVideo(context);
                        },
                        child: const Icon(
                            Icons.remove_circle_outline_rounded
                        ),
                      );
                    }
                  })
                ],
              ),
            ),
            Obx(() {
              if (controller.isVideoInitialized.value == true) {
                return AppVideoPlayerWidget(controller.videoPlayerController).build();
              }
              return const SizedBox();
            }),

            // title
            Container(
              margin: const EdgeInsets.only(left: 2, top: 32, bottom: 8),
              child: AppTextBody2Widget()
                  .setText('Tên công thức*')
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
                  .setText('Mô tả công thức*')
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
                  .setText('Khẩu phần (người)*')
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
                  .setText('Thời gian ước tính (phút)*')
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
                    hintText: 'Chuẩn bị*',
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
                    hintText: 'Thực hiện*',
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

            // ingredient tags
            const SizedBox(height: 32),
            Row(
              children: [
                AppTextBody2Widget()
                    .setText('Tag nguyên liệu')
                    .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
                    .build(context),
                const Spacer(),
                InkWell(
                  onTap: () {controller.startSearchIngredientTag();},
                  child: const Icon(Icons.add_circle_outline_rounded),
                )
              ],
            ),
            Obx(() => Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                controller.ingredientTagList.value.length,
                    (index) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor(),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          AppAvatarWidget(avtUrl: controller.ingredientTagList.value[index].imageUrl, size: 24)
                              .build(context),
                          const SizedBox(
                            width: 8,
                          ),
                          AppTextBody2Widget()
                              .setText(controller.ingredientTagList.value[index].name)
                              .build(context),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.removeIngredientTag(index);
                            },
                            child: const Icon(Icons.clear_rounded, size: 16,),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),

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
                                  'Nguyên liệu (${controller.ingredientList.value.length})*')
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
                                  'Thực hiện (${controller.stepList.value.length})*')
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
                                            color: AppColors.whiteColor(),
                                            child: Center(
                                              child: AppTextBody3Widget()
                                                  .setText(
                                                      'Ảnh hướng dẫn')
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
