part of 'follow_management_controller.dart';

class FollowManagementPage extends GetView<FollowManagementController> {
  FollowManagementPage({super.key});

  @override
  final controller = Get.put(FollowManagementController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: _body(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _body(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          // search bar
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(12, 16, 12, 4),
            child: Obx(
              () {
                return AppCornerCardTextFieldWidget(
                  backgroundColor: AppColors.grayColor(level: 0),
                  elevation: 0,
                  leadingIcon: const Icon(Icons.arrow_back_ios_new_rounded),
                  suffixIcon: controller.searchController.value.value.text != ''
                      ? const Icon(Icons.clear)
                      : const SizedBox(),
                  onLeadingPressed: () => controller.goBack(context),
                  suffixIconOnPress: () {
                    controller.searchController.value.clear();
                    controller.searchUser();
                    controller.isSearching.value = false;
                  },
                  hintText: 'Gõ tên hoặc email người bạn cần tìm',
                  controller: controller.searchController.value,
                  onChange: (String value) {
                    controller.searchController.refresh();
                    controller.searchUser();
                    if (controller.searchController.value.text != '' &&
                        controller.isSearching.value == false) {
                      controller.isSearching.value = true;
                    } else if (controller.searchController.value.text == '' &&
                        controller.isSearching.value == true) {
                      controller.isSearching.value = false;
                    }
                  },
                ).build(context);
              },
            ),
          ),
          // follow tabs or search result
          Expanded(
            flex: 1,
            child: Obx(
              () {
                if (controller.isSearching.value == false) {
                  return Column(
                    children: [
                      TabBar(
                        unselectedLabelColor: AppColors.grayColor(level: 2),
                        labelColor: AppColors.primaryColor(),
                        indicatorColor: AppColors.primaryColor(level: 2),
                        tabs: const [
                          Tab(
                            text: 'Đang theo dõi',
                          ),
                          Tab(text: 'Được theo dõi'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            FollowingView(),
                            FollowedView(),
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return const SearchUserView().build(context);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
