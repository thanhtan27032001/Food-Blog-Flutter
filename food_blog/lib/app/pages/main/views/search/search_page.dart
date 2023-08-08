part of 'search_controller.dart';

class SearchPage extends GetView<SearchController> {
  SearchPage({super.key});

  @override
  final controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        statusBarColor: AppColors.primaryColor(level: 2),
        pageBackgroundColor: Colors.white10,
        pageBody: _body(context));
  }

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: AppSearchBarWidget(),
        ),
        Container(
          margin: EdgeInsets.all(16),
          child: AppTextBody1Widget()
              .setText('Lịch sử tìm kiếm')
              .setTextStyle(
                TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
              .build(context),
        ),
        Placeholder(),
      ],
    );
  }
}
