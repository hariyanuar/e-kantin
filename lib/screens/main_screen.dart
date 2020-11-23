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
        children: [
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        color: Theme.of(context).accentColor,
        activeColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 7.0,
        height: 70,
        items: [
          TabItem(icon: Icon(Icons.home_outlined, size: 30.0), activeIcon: Icon(Icons.home_outlined, color: Theme.of(context).buttonColor, size: 30.0), title: ' '),
          TabItem(icon: Icon(Icons.receipt_long, size: 30.0), activeIcon: Icon(Icons.receipt_long, color: Theme.of(context).buttonColor, size: 30.0), title: ' '),
          TabItem(icon: Icon(Icons.qr_code_scanner, color: Colors.white, size: 30.0), activeIcon: Icon(Icons.qr_code_scanner, color: Colors.white, size: 30.0), title: ' '),
          TabItem(icon: Icon(Icons.stacked_bar_chart, size: 30.0), activeIcon: Icon(Icons.stacked_bar_chart, color: Theme.of(context).buttonColor, size: 30.0), title: ' '),
          TabItem(icon: Icon(Icons.person_outline, size: 30.0), activeIcon: Icon(Icons.person_outline, color: Theme.of(context).buttonColor, size: 30.0), title: ' '),
        ],
        onTap: (i) {
          widget.currentTabIndex = i;
        },
        style: TabStyle.fixedCircle,
      ),
    );
  }
}
