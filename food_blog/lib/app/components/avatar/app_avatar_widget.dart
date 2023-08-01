import 'package:flutter/cupertino.dart';

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
          child: Image.network(
            avtUrl ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}