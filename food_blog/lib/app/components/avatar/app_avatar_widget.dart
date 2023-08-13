import 'package:flutter/material.dart';

class AppAvatarWidget extends StatelessWidget {
  final String? avtUrl;
  final double size;
  final Function()? onPress;

  const AppAvatarWidget({required this.avtUrl, required this.size, this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(size/2)),
          child: avtUrl != null ? Image.network(
            avtUrl!,
            fit: BoxFit.cover,
          ) : Icon(Icons.account_circle_rounded, size: size,),
        ),
      ),
    );
  }
}