part of 'search_controller.dart';

class SearchPage extends GetView<SearchController> {
  SearchPage({super.key});

  @override
  final controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        statusBarColor: AppColors.primaryColor(level: 2),
        pageBackgroundColor: AppColors.whiteColor(),
        resizeToAvoidBottomInset: false,
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
                controller.searchRecipe();
              },
              hintText: 'Gõ công thức cần tìm',
              controller: controller.searchController.value,
              backgroundColor: AppColors.grayColor(level: 0),
              elevation: 0,
              autofocus: true,
              onChange: (String value) {
                controller.searchController.refresh();
                controller.searchRecipe();
              },
            ).build(context);
          }),
        ),
        Expanded(
          flex: 1,
          child: Obx(() {
            if (controller.searchResultList.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: AppTextBody1Widget()
                        .setText('Kết quả tìm kiếm')
                        .setTextStyle(
                          const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        .build(context),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Wrap(
                        children: List.generate(
                          controller.searchResultList.length,
                          (index) => FractionallySizedBox(
                            widthFactor: 0.5,
                            child: LayoutBuilder(
                              builder: (context, constraints) => Padding(
                                padding: const EdgeInsets.all(2),
                                child: RecipePreviewCardLv2Widget(
                                  controller.searchResultList[index],
                                  onPressed: () {
                                    Get.to(() => RecipeDetailPage(),
                                        arguments: controller
                                            .searchResultList[index].recipeId);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
