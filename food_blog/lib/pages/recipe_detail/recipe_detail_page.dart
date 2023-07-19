import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:food_blog/models/recipe_model.dart';
import 'package:food_blog/models/recipe_step.dart';
import 'package:food_blog/pages/recipe_detail/widget/app_expansion_panel.dart';
import 'package:food_blog/pages/recipe_detail/widget/recipe_ingredient_list_widget.dart';
import 'package:food_blog/pages/recipe_detail/widget/recipe_step_list_widget.dart';
import 'package:food_blog/pages/recipe_detail/widget/recipe_summary_card.dart';

class RecipeDetailPage extends StatefulWidget {
  final RecipeModel recipeModel;

  RecipeDetailPage(this.recipeModel);

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
                    Text(
                      'Beefsteak',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
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
                      Container(
                        width: 48,
                        height: 48,
                        child: ClipRRect(
                          child: Image.network(
                            'https://znews-photo.zingcdn.me/w660/Uploaded/spivovxi/2021_06_12/thoi_diem_nguy_hiem_traderviet3.jpg',
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nguyễn Thành Tân',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  size: 16, color: AppColors.grayColor(level: 2)),
                              SizedBox(width: 4),
                              Text(
                                '1 giờ trước',
                                style: TextStyle(
                                    color: AppColors.grayColor(level: 2)),
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),

              // description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppRecipeExpansion(
                  description:
                      'Bít tết, là một món ăn bao gồm miếng thịt bò lát phẳng, thường được nướng vỉ, áp chảo hoặc nướng broiling ở nhiệt độ cao.\nNhững miếng thịt mềm hơn được cắt ra từ phần thăn và sườn được làm chín nhanh chóng, sử dụng nhiệt khô và phục vụ toàn bộ.',
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
                  RecipeStep(1, 'Cắt bò thành những miếng có độ dày khoảng 03 cm có trọng lượng từ 200-250 gram.'),
                  RecipeStep(2, 'Ướp thịt bò với muối và tiêu.', imgUrl: 'https://ussinavietnam.vn/wp-content/uploads/2022/11/tieuchi_3.png'),
                  RecipeStep(3, 'Dùng chảo gang nóng cho dầu oliu vào, dầu sôi cho từng miếng thịt bò đã ướp vào áp chảo - mỗi mặt áp chảo trong vòng 2 phút, mỗi cạnh bên 40 giây.'),
                  RecipeStep(4, 'Cho thịt nghỉ 5 phút, cho ra đĩa rồi thưởng thức.', imgUrl: 'https://websitecukcukvn.misacdn.net/wp-content/uploads/2023/03/batch_moo-beef-st-4.jpeg'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
