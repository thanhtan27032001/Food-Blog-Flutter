part of 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  HomePage({super.key});

  @override
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // search bar
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.grayColor(level: 0)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColors.grayColor(level: 2),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      AppTextBody1Widget()
                          .setText('Gõ nguyên liệu để tìm')
                          .setTextAlign(TextAlign.start)
                          .setColor(AppColors.grayColor(level: 2))
                          .build(context),
                    ],
                  ),
                ),
              ),
            ),
            // // receipt season suggest
            // HomeSuggestionWidget(
            //   title: 'Các nguyên liệu đang trong mùa',
            // ),
            //
            // // receipt following suggest
            // HomeSuggestionWidget(
            //   title: 'Các công thức từ người bạn đang theo dõi',
            // ),
            //
            // receipt popular suggest
            Obx(
              () => controller.recipePopularList.value != null
                  ? HomeSuggestionWidget(
                      title: 'Các công thức phổ biến',
                      recipeList: controller.recipePopularList.value!,
                    )
                  : AppTextBody1Widget().setText('Đang tải...').build(context),
            ),

            // receipt newest suggest
            Obx(
              () => controller.recipeNewestList.value != null
                  ? HomeSuggestionWidget(
                      title: 'Các công thức mới nhất',
                      recipeList: controller.recipeNewestList.value!,
                    )
                  : AppTextBody1Widget().setText('Đang tải...').build(context),
            ),
          ],
        ),
      ),
    );
  }
}
