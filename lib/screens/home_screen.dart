import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../utils/default_box_shadow.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        children: [
          Stack(
            children: [
              _buildBackground(context),
              Padding(
                padding:
                    const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    _buildProfileTile(context),
                    SizedBox(
                      height: 10,
                    ),
                    _buildDashboard(context),
                    SizedBox(
                      height: 10,
                    ),
                    _buildCategories(context),
                  ],
                ),
              ),
            ],
          ),
          StickyHeaderBuilder(
            builder: (ctx, stuckAmount) {
              stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);

              return Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).padding.top * stuckAmount,
                      color: Theme.of(context).buttonColor.withOpacity(stuckAmount)),
                  Container(
                    height: 60.0,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    color:
                        Theme.of(context).buttonColor.withOpacity(stuckAmount),
                    child: Text(
                      'Transactions',
                      style: TextStyle(
                          color: Color.lerp(Theme.of(context).buttonColor,
                              Colors.white, stuckAmount)),
                    ),
                  ),
                ],
              );
            },
            content: Column(
              children: [
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
                ListTile(title: Text('#0')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).buttonColor,
          height: 250,
        ),
        Positioned(
          top: -350,
          left: -350,
          height: 500.0,
          width: 500.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(36, 125, 216, 1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -250,
          right: -350,
          height: 500.0,
          width: 500.0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTile(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.account_circle, size: 50, color: Colors.white),
      subtitle: Text('089603058683', style: TextStyle(color: Colors.white)),
      title: Text('Hari Yanuar', style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.message_sharp, color: Colors.white),
    );
  }

  Widget _buildDashboard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: DefaultBoxShadow,
      ),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ListTile(
                title: Text('Balance', style: Theme.of(context).textTheme.caption),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rp', style: Theme.of(context).textTheme.caption),
                    SizedBox(width: 5.0),
                    Text('500,000', style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                trailing:
                    Icon(Icons.widgets, color: Theme.of(context).buttonColor),
              ),
            ),
            Divider(thickness: 1, height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildGridButton(
                  context,
                  Icons.logout,
                  'Transfer',
                  () {},
                ),
                _buildGridButton(
                  context,
                  Icons.login,
                  'Request',
                  () {},
                ),
                _buildGridButton(
                  context,
                  Icons.add_box_outlined,
                  'Top Up',
                  () {},
                ),
              ],
            )
          ],
        ),
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        boxShadow: DefaultBoxShadow,
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildGridButton(
                  context,
                  Icons.phone_android,
                  'Internet',
                  () {},
                ),
                _buildGridButton(
                  context,
                  Icons.waterfall_chart,
                  'Water',
                  () {},
                ),
                _buildGridButton(
                  context,
                  Icons.electrical_services,
                  'Electricity',
                  () {},
                ),
                _buildGridButton(
                  context,
                  Icons.videogame_asset,
                  'Games',
                  () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildGridButton(
                  context,
                  Icons.tv,
                  'TV',
                  () {},
                ),
                _buildGridButton(
                  context,
                  Icons.directions_bus,
                  'Bus',
                  () {},
                ),
                _buildGridButton(
                  context,
                  Icons.attach_money,
                  'E-Money',
                  () {},
                ),
                _buildGridButton(
                  context,
                  Icons.widgets,
                  'More',
                  () {},
                ),
              ],
            ),
          ],
        ),
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }

  Widget _buildGridButton(
      BuildContext context, IconData icon, String title, Function onTap) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 30.0, color: Theme.of(context).buttonColor),
              SizedBox(height: 5.0),
              Text(title),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 20.0),
        ),
        onTap: onTap,
      ),
    );
  }
}
