import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../services/authentication_service.dart';

class LoginScreen extends StatefulWidget {
  bool _isLoading = false;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 75.0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Hello.\nWelcome Back',
                  style: Theme.of(context).textTheme.headline3.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 16,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 16,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.w500),
                          suffix: Text('SHOW', style: TextStyle(color: Theme.of(context).primaryColor))
                      ),
                    ),
                    SizedBox(height: 25),
                    Text('Forgot Password ?',
                        style: Theme.of(context).textTheme.caption),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).buttonColor.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 35.0,
                            offset: Offset(0.0, 10.0),
                          )
                        ],
                      ),
                      child: FlatButton(
                        child:!widget._isLoading ? Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ) : SpinKitWave(color: Colors.white, size: 16),
                        color: Theme.of(context).buttonColor,
                        padding: EdgeInsets.all(17.5),
                        onPressed: () {
                          context.read<AuthenticationService>().signIn(_usernameController.text.trim(), _passwordController.text.trim()).then((String message) {
                            setState(() {
                              Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                message: message,
                                margin: EdgeInsets.all(20.0),
                                duration: Duration(seconds: 2),
                              )
                                ..show(context);
                              widget._isLoading = false;
                            });
                          });
                          setState(() {
                            widget._isLoading = true;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}