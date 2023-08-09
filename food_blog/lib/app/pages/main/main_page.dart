part of 'main_controller.dart';

class MainPage extends GetView<MainController> {
  MainPage({super.key});

  // @override
  // State<StatefulWidget> createState() => _MainPageState();
  @override
  final controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: controller._page[controller._currentIndex.value],
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller._currentIndex.value,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline_rounded,
              ),
              label: 'My recipe'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_rounded,
              ),
              label: 'My follow'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'My account'),
        ],
        onTap: (value) {
          controller._currentIndex.value = value;
        },
        elevation: 16,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor(level: 1),
        unselectedItemColor: AppColors.grayColor(level: 2),
        iconSize: 28,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // backgroundColor: Colors.red,
      ),
    ));
  }
}

// class _MainPageState extends State<MainPage> {
//   final MainController controller = MainController();
//
//   int _currentIndex = 0;
//   final List<Widget> _page = [
//     const HomeView(),
//     Container(
//       color: Colors.black54,
//     ),
//     const RecipeManagementPage(),
//     Container(
//       color: Colors.yellow,
//     ),
//     Container(
//       color: Colors.green,
//     ),
//   ];
//
//
//   @override
//   void initState() {
//     super.initState();
//     // controller.createUser();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AppMainPageWidget(
//       statusBarColor: AppColors.primaryColor(level: 2),
//       pageBackgroundColor: AppColors.whiteColor(),
//       pageBody: _page[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home_outlined,
//               ),
//               label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.search,
//               ),
//               label: 'Search'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.add_circle_outline_rounded,
//               ),
//               label: 'My recipe'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.favorite_border_rounded,
//               ),
//               label: 'My follow'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.account_circle_outlined,
//               ),
//               label: 'My account'),
//         ],
//         onTap: (value) => setState(() {
//           _currentIndex = value;
//         }),
//         elevation: 16,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: AppColors.primaryColor(level: 1),
//         unselectedItemColor: AppColors.grayColor(level: 2),
//         iconSize: 28,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         // backgroundColor: Colors.red,
//       ),
//     );
//   }
// }
