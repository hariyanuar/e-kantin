import 'package:flutter/material.dart';

class CustomTabItem extends StatelessWidget {
  final Color activeIconColor;
  final bool isActive;
  final IconData iconData;

  const CustomTabItem(this.iconData, {Key key, this.isActive, this.activeIconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Center(child: Icon(iconData, size: 25.0, color: isActive ? activeIconColor : Theme.of(context).iconTheme,)),
      onPressed: () {},
    );
  }
}
