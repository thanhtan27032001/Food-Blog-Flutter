import 'package:flutter/material.dart';

class RecipeSummaryCard extends StatelessWidget {
  late Widget icon;
  late String title;
  late String body;

  RecipeSummaryCard({super.key, required this.icon, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 4,),
        Text(title),
        const SizedBox(height: 4,),
        Text(body, style: const TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }

}