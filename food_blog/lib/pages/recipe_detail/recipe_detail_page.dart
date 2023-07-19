import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blog/components/mainPage/app_main_page_widget.dart';
import 'package:food_blog/configs/app_colors.dart';
import 'package:food_blog/models/recipe_model.dart';
import 'package:food_blog/pages/recipe_detail/widget/app_expansion_panel.dart';
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
                    icon: Icon(Icons.arrow_back_ios_new),
                    iconSize: 16,
                    color: AppColors.whiteColor(),
                    focusColor: Colors.yellow,
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
              'https://file.hstatic.net/200000303304/article/steak_10_b1b1397477ea4c8ca1f215989632a614_1024x1024.jpg',
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: AppRecipeExpansion(
                description:
                    'Bít tết, là một món ăn bao gồm miếng thịt bò lát phẳng, thường được nướng vỉ, áp chảo hoặc nướng broiling ở nhiệt độ cao.\nNhững miếng thịt mềm hơn được cắt ra từ phần thăn và sườn được làm chín nhanh chóng, sử dụng nhiệt khô và phục vụ toàn bộ.',
                maxLine: 4,
                isExpanded: false,
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
