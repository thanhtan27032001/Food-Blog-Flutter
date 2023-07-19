import 'package:flutter/material.dart';

class AppRecipeExpansion extends StatelessWidget {
  late String description;
  late int maxLine;
  late bool isExpanded;

  AppRecipeExpansion({
    super.key,
    required this.description,
    required this.maxLine,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 100),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              description,
              maxLines: isExpanded ? null : maxLine,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(height: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
