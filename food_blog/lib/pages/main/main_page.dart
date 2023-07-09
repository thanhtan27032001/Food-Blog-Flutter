part of 'main_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final MainController controller = MainController();

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: Column(
        children: [
          Image.network(
            controller.user!.photoURL!,
            width: 100,
            height: 100,
          ),
          Text(controller.user!.displayName!),
        ],
      ),
    );
  }
}
