import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.leadingIcon,

    this.actionIcon,
    required this.title,
    required this.onTap,
  });
  final Widget? leadingIcon;
  final Widget? actionIcon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(onPressed: onTap, icon: leadingIcon ?? SizedBox()),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: "inter",
        ),
      ),
      actions: [IconButton(onPressed: () {}, icon: actionIcon ?? SizedBox())],
    );
  }
}
