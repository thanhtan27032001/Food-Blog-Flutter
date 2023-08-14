part of 'account_controller.dart';

class AccountPage extends GetView<AccountController> {
  AccountPage({super.key});

  @override
  final controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        statusBarColor: AppColors.primaryColor(level: 2),
        pageBackgroundColor: AppColors.whiteColor(),
        pageBody: _body(context));
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        AppAvatarWidget(
            avtUrl: UserData.instance().getUserLogin()?.avatarUrl,
            size: 120),
        const SizedBox(height: 16),
        AppTextHeading3Widget()
            .setText(UserData.instance().getUserLogin()?.nickname)
            .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
            .build(context),
        const SizedBox(height: 4),
        AppTextBody1Widget()
            .setText(UserData.instance().getUserLogin()?.email)
            .setColor(AppColors.grayColor(level: 2))
            .build(context),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: const Divider(thickness: 1),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 2, backgroundColor: AppColors.whiteColor()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  const Icon(Icons.account_circle_outlined, color: Colors.black,),
                  const SizedBox(width: 8,),
                  AppTextBody1Widget()
                      .setText('Cập nhật thông tin')
                      .setColor(AppColors.blackColor())
                      .build(context),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppColors.blackColor(),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 2, backgroundColor: AppColors.whiteColor()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  const Icon(Icons.archive, color: Colors.black,),
                  const SizedBox(width: 8,),
                  AppTextBody1Widget()
                      .setText('Công thức lưu trữ')
                      .setColor(AppColors.blackColor())
                      .build(context),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppColors.blackColor(),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 2, backgroundColor: AppColors.whiteColor()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  const Icon(Icons.password_rounded, color: Colors.black,),
                  const SizedBox(width: 8,),
                  AppTextBody1Widget()
                      .setText('Đổi mật khẩu')
                      .setColor(AppColors.blackColor())
                      .build(context),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppColors.blackColor(),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () {controller.logout();},
            style: ElevatedButton.styleFrom(
                elevation: 2, backgroundColor: AppColors.whiteColor()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  const Icon(Icons.logout, color: Colors.black,),
                  const SizedBox(width: 8,),
                  AppTextBody1Widget()
                      .setText('Đăng xuất')
                      .setColor(AppColors.blackColor())
                      .build(context),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppColors.blackColor(),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
