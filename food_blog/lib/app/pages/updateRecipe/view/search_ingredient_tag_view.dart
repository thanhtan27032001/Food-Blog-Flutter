part of '../update_recipe_controller.dart';

class SearchIngredientTagView extends GetView<UpdateRecipeController> {
  const SearchIngredientTagView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        statusBarColor: AppColors.primaryColor(level: 2),
        appbar: AppBarWidget(
          title: 'Tìm tag nguyên liệu',
          titleColor: AppColors.whiteColor(),
          isCenterTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            color: AppColors.whiteColor(),
            onPressed: () {
              controller.cancelSearchIngredientTag();
            },
          ),
          backgroundColor: AppColors.primaryColor(level: 2),
        ).build(context),
        resizeToAvoidBottomInset: false,
        pageBackgroundColor: AppColors.whiteColor(),
        pageBody: _body(context));
  }

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Obx(() {
            return AppCornerCardTextFieldWidget(
              leadingIcon: const Icon(Icons.search),
              suffixIcon: controller.searchController.value.value.text != ''
                  ? const Icon(Icons.clear)
                  : const SizedBox(),
              suffixIconOnPress: () {
                controller.searchController.value.clear();
                controller.searchIngredientTag();
              },
              hintText: 'Gõ tag hoặc tên nguyên liệu cần tìm',
              controller: controller.searchController.value,
              onChange: (String value) {
                controller.searchController.refresh();
                controller.searchIngredientTag();
              },
            ).build(context);
          }),
        ),
        Expanded(
          flex: 1,
          child: Obx(() {
            if (controller.ingredientTagFilteredList.value.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: AppTextBody1Widget()
                        .setText('Kết quả tìm kiếm')
                        .setTextStyle(
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        .build(context),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.ingredientTagFilteredList.value.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.addIngredientTag(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            color: index % 2 == 0 ? AppColors.grayColor(level: 0) : AppColors.whiteColor()
                          ),
                          child: Row(
                            children: [
                              AppAvatarWidget(
                                  avtUrl: controller.ingredientTagFilteredList
                                      .value[index].imageUrl, size: 32),
                              const SizedBox(width: 8,),
                              AppTextBody2Widget().setText(
                                  controller.ingredientTagFilteredList.value[index]
                                      .name).build(context),
                              const Spacer(),
                              Icon(Icons.check_circle_outline_rounded, size: 20, color: AppColors.secondaryColor(),),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            } else {
              if (controller.searchController.value.text == '') {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/gifs/search.gif',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextBody1Widget()
                          .setText('Hãy thử tìm gì đó')
                          .setColor(AppColors.grayColor(level: 2))
                          .build(context),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                );
              } else {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/gifs/sad.gif',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextBody1Widget()
                          .setText('Oh noooooo!!!\nKhông có công thức phù hợp')
                          .setColor(AppColors.grayColor(level: 2))
                          .setTextAlign(TextAlign.center)
                          .build(context),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                );
              }
            }
          }),
        )
      ],
    );
  }
}