import 'package:flutter/material.dart';

import '../utils/default_box_shadow.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(context),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 75.0, horizontal: 20.0),
          child: Column(
            children: [
              ListTile(
                leading:
                    Icon(Icons.account_circle, size: 40, color: Colors.white),
                title:
                    Text('Hari Yanuar', style: TextStyle(color: Colors.white)),
                subtitle:
                    Text('089603058683', style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.message_sharp, color: Colors.white),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: DefaultBoxShadow,
                ),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Balance'),
                        subtitle: Text('Rp500,000'),
                        trailing: Icon(Icons.widgets,
                            color: Theme.of(context).buttonColor),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.logout, size: 50.0, color: Theme.of(context).buttonColor),
                                  SizedBox(height: 5.0),
                                  Text('Transfer'),
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.login, size: 50.0, color: Theme.of(context).buttonColor),
                                  SizedBox(height: 5.0),
                                  Text('Request'),
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.add_box_outlined, size: 50.0, color: Theme.of(context).buttonColor),
                                  SizedBox(height: 5.0),
                                  Text('Topup'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ],
          ),
        )
      ],
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
}
