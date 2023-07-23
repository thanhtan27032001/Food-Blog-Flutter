import 'package:flutter/material.dart';
import 'package:food_blog/components/text/app_text_base_builder.dart';

class RecipeSummaryCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String body;

  const RecipeSummaryCard(
      {super.key, required this.icon, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(
          height: 4,
        ),
        AppTextBody2Widget().setText(title).build(context),
        const SizedBox(
          height: 4,
        ),
        AppTextBody2Widget()
            .setText(body)
            .setTextStyle(const TextStyle(fontWeight: FontWeight.bold))
            .build(context),
      ],
    );
  }
}
