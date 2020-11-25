import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  int currentTabIndex = 0;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: widget.currentTabIndex,
          children: [
            HomeScreen(),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          activeColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          color: Theme.of(context).accentColor,
          elevation: 7.0,
          height: 60,
          items: [
            TabItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home_outlined, color: Theme.of(context).buttonColor)),
            TabItem(icon: Icon(Icons.receipt_long), activeIcon: Icon(Icons.receipt_long, color: Theme.of(context).buttonColor)),
            TabItem(icon: Icon(Icons.qr_code_scanner, color: Colors.white, size: 30), activeIcon: Icon(Icons.qr_code_scanner, color: Colors.white, size: 30)),
            TabItem(icon: Icon(Icons.stacked_bar_chart), activeIcon: Icon(Icons.stacked_bar_chart, color: Theme.of(context).buttonColor)),
            TabItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person_outline, color: Theme.of(context).buttonColor)),
          ],
          onTap: (i) {
            setState(() {
              widget.currentTabIndex = i;
            });
          },
          style: TabStyle.fixedCircle,
        ),
      );
  }
}
