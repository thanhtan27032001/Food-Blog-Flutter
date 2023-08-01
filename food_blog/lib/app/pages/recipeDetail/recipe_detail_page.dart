import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blog/app/components/avatar/app_avatar_widget.dart';
import 'package:food_blog/app/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';
import 'package:food_blog/domain/models/recipe_comment.dart';
import 'package:food_blog/domain/models/recipe_model.dart';
import 'package:food_blog/domain/models/recipe_step.dart';
import 'package:food_blog/domain/models/user.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/app_expansion_panel.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/recipe_comment_list_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/recipe_ingredient_list_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/recipe_step_list_widget.dart';
import 'package:food_blog/app/pages/recipeDetail/widget/recipe_summary_card.dart';

class RecipeDetailPage extends StatefulWidget {
  final RecipeModel recipeModel;

  const RecipeDetailPage(this.recipeModel, {super.key});

  @override
  State<StatefulWidget> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      statusBarColor: AppColors.primaryColor(level: 2),
      pageBackgroundColor: AppColors.whiteColor(),
      pageBody: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 64),
          child: Column(
            children: [
              // app bar
              Container(
                width: double.infinity,
                height: 50,
                color: AppColors.primaryColor(),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 16,
                      color: AppColors.whiteColor(),
                    ),
                    AppTextBody1Widget()
                        .setText('Beefsteak')
                        .setTextStyle(
                          const TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                        .build(context),
                  ],
                ),
              ),

              // image
              Image.network(
                'https://cdn.tgdd.vn/2020/11/CookProduct/1-1200x676-22.jpg',
                fit: BoxFit.fill,
              ),

              // author info
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      AppAvatarWidget(
                          avtUrl:
                              'https://znews-photo.zingcdn.me/w660/Uploaded/spiv'
                                  'ovxi/2021_06_12/thoi_diem_nguy_hiem_traderviet3.jpg',
                          size: 48,
                          onPress: () {}),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextBody2Widget()
                                .setText('Nguyễn Thành Tân')
                                .setTextStyle(const TextStyle(
                                    fontWeight: FontWeight.bold))
                                .build(context),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_time,
                                    size: 16,
                                    color: AppColors.grayColor(level: 2)),
                                const SizedBox(width: 4),
                                AppTextBody2Widget()
                                    .setText('1 giờ trước')
                                    .setColor(AppColors.grayColor(level: 2))
                                    .build(context),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // description
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppRecipeExpansion(
                  description:
                      'Bít tết, là một món ăn bao gồm miếng thịt bò lát phẳng, '
                      'thường được nướng vỉ, áp chảo hoặc nướng broiling ở '
                      'nhiệt độ cao.\nNhững miếng thịt mềm hơn được cắt ra '
                      'từ phần thăn và sườn được làm chín nhanh chóng, sử '
                      'dụng nhiệt khô và phục vụ toàn bộ.',
                ),
              ),

              // summary cards
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RecipeSummaryCard(
                        icon: SvgPicture.asset('assets/svgs/meal_serving.svg'),
                        title: 'Khẩu phần',
                        body: '2 người'),
                    RecipeSummaryCard(
                        icon: SvgPicture.asset('assets/svgs/prepare_time.svg'),
                        title: 'Chuẩn bị',
                        body: '30 phút'),
                    RecipeSummaryCard(
                        icon: SvgPicture.asset('assets/svgs/cook_time.svg'),
                        title: 'Thực hiện',
                        body: '10 phút'),
                  ],
                ),
              ),

              // ingredient list
              const SizedBox(
                height: 64,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: RecipeIngredientListWidget(
                  ingredientList: [
                    '500 gram thịt bò',
                    '2 muỗng cà phê dầu olive',
                    '2 nhúm muối',
                    '2 nhúm tiêu hạt',
                    '2 nhánh hương thảo',
                    '1 củ tỏi'
                  ],
                ),
              ),

              // step list
              const SizedBox(
                height: 64,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RecipeStepWidget(recipeStepList: [
                  RecipeStep(1,
                      'Cắt bò thành những miếng có độ dày khoảng 03 cm có trọng lượng từ 200-250 gram.'),
                  RecipeStep(2, 'Ướp thịt bò với muối và tiêu.',
                      imgUrl:
                          'https://ussinavietnam.vn/wp-content/uploads/2022/11/tieuchi_3.png'),
                  RecipeStep(3,
                      'Dùng chảo gang nóng cho dầu oliu vào, dầu sôi cho từng miếng thịt bò đã ướp vào áp chảo - mỗi mặt áp chảo trong vòng 2 phút, mỗi cạnh bên 40 giây.'),
                  RecipeStep(
                      4, 'Cho thịt nghỉ 5 phút, cho ra đĩa rồi thưởng thức.',
                      imgUrl:
                          'https://websitecukcukvn.misacdn.net/wp-content/uploads/2023/03/batch_moo-beef-st-4.jpeg'),
                ]),
              ),

              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: const Divider(
                  thickness: 1,
                ),
              ),

              // add comment button
              FilledButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add_comment_rounded,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    AppTextBody2Widget().setText('Thêm bình luận').build(context),
                  ],
                ),
              ),

              // comments
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: RecipeCommentListWidget([
                  RecipeComment(
                      'id',
                      'Gooood',
                      DateTime.now(),
                      User('id', 'Nguyễn Thành Tân',
                          'https://images.thequint.com/thequint-fit%2F2019-10%2Fed93b668-8d3f-4505-9b43-bffabc8873d9%2Ftomato.jpg')),
                  RecipeComment(
                      'id',
                      'Ngonnn',
                      DateTime.now(),
                      User('id', 'Nguyễn A',
                          'https://images.thequint.com/thequint-fit%2F2019-10%2Fed93b668-8d3f-4505-9b43-bffabc8873d9%2Ftomato.jpg')),
                  RecipeComment('id', 'Tuyệt vời', DateTime.now(),
                      User('id', 'Nguyễn B', null)),
                  RecipeComment(
                      'id',
                      'bla bla bla\nbla bla bla\nbla bla blasghsdjhfksldglksdhkjfhsdklghsdkgafdadfadsfasdfasdf',
                      DateTime.now(),
                      User('id', 'Nguyễn C', null)),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
