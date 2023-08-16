part of 'follow_management_controller.dart';

class FollowManagementPage extends GetView<FollowManagementController> {
  FollowManagementPage({super.key});

  @override
  final controller = Get.put(FollowManagementController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AppMainPageWidget(
        statusBarColor: AppColors.primaryColor(level: 2),
        pageBackgroundColor: AppColors.whiteColor(),
        pageBody: _body(context),
        appbar: AppBarWidget(
          title: 'Quản lý theo dõi',
          backgroundColor: AppColors.primaryColor(level: 2),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.flight)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_car)),
            ],
          ),
        ).build(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return TabBarView(
      children: [
        Icon(Icons.flight, size: 350),
        Icon(Icons.directions_transit, size: 350),
        Icon(Icons.directions_car, size: 350),
      ],
    );
  }
}
