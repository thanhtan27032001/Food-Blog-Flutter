import 'package:flutter/material.dart';

class AppRecipeExpansion extends StatefulWidget {
  late String description;
  late int maxLine;
  late bool isExpanded;

  AppRecipeExpansion({
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
            child: Text(
              description,
              maxLines: isExpanded ? null : maxLine,
              overflow: isExpanded ? null : TextOverflow.ellipsis,
              style: const TextStyle(height: 1.5),
            ),
          ),
        ),
        TextButton(
          onPressed: () => _changeExpandStatus(),
          child: Text(isExpanded ? 'Thu gọn' : 'Xem chi tiết'),
        ),
      ],
    );
  }
}
