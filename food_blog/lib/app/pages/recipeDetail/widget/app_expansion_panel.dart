import 'package:flutter/material.dart';
import 'package:food_blog/app/components/text/app_text_base_builder.dart';
import 'package:food_blog/app/configs/app_colors.dart';

class AppRecipeExpansion extends StatefulWidget {
  final String description;
  final int maxLine;
  final bool isExpanded;

  const AppRecipeExpansion({
    super.key,
    required this.description,
    this.maxLine = 3,
    this.isExpanded = false,
  });

  @override
  State<StatefulWidget> createState() => AppRecipeExpansionState();
}

class AppRecipeExpansionState extends State<AppRecipeExpansion> {
  late String description;
  late int maxLine;
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    description = widget.description;
    maxLine = widget.maxLine;
    isExpanded = widget.isExpanded;
  }

  void _changeExpandStatus() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 100),
          child: SizedBox(
            width: double.infinity,
            child: AppTextBody2Widget()
                .setText(description)
                .setMaxLines(isExpanded ? null : maxLine)
                .setTextOverFlow(isExpanded ? null : TextOverflow.ellipsis)
                .setTextStyle(const TextStyle(height: 1.5))
                .build(context),
          ),
        ),
        TextButton(
          onPressed: () => _changeExpandStatus(),
          child: AppTextBody2Widget()
              .setText(isExpanded ? 'Thu gọn' : 'Xem chi tiết')
              .setColor(AppColors.secondaryColor(level: 2))
              .build(context),
        ),
      ],
    );
  }
}
