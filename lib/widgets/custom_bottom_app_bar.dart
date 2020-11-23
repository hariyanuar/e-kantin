import 'package:flutter/material.dart';

import 'custom_tab_item.dart';

class CustomBottomAppbar extends StatelessWidget {
  final int currentIndex;
  final Color activeIconColor;

  const CustomBottomAppbar({Key key, this.currentIndex, this.activeIconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> isActive = List.generate(5, (index) => false);

    List<Widget> children = [
      CustomTabItem(Icons.home_outlined, activeIconColor: activeIconColor, isActive: isActive[0]),
      CustomTabItem(Icons.receipt_long_sharp, activeIconColor: activeIconColor, isActive: isActive[1]),
      SizedBox(width: 45.0),
      CustomTabItem(Icons.stacked_bar_chart, activeIconColor: activeIconColor, isActive: isActive[3]),
      CustomTabItem(Icons.person_outline, activeIconColor: activeIconColor, isActive: isActive[4]),
    ];


    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
      elevation: 28.0,
      shape: const CircularNotchedRectangle(),
    );
  }
}
