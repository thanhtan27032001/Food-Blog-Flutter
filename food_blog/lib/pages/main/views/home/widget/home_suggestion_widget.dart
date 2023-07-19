import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_blog/models/recipe_model.dart';
import 'package:food_blog/pages/main/views/home/widget/recipe_preview_card_widget.dart';
import 'package:food_blog/pages/recipe_detail/recipe_detail_page.dart';

class HomeSuggestionWidget extends StatefulWidget {

  late BuildContext pageContext;
  late String title;


  HomeSuggestionWidget({required this.pageContext, required this.title});

  @override
  State<StatefulWidget> createState() => HomeSuggestionWidgetState();

}

class HomeSuggestionWidgetState extends State<HomeSuggestionWidget> {

  late BuildContext pageContext;
  late String title;


  @override
  void initState() {
    super.initState();
    pageContext = widget.pageContext;
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Các nguyên liệu đang trong mùa',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
            width: double.infinity,
            height: 180,
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemCount: 20,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(pageContext, MaterialPageRoute(builder: (context) => RecipeDetailPage(RecipeModel()),));
                  },
                  child: RecipePreviewCardWidget(RecipeModel(), cardWidth: 200, cardHeight: 180,),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

}