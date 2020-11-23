import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../services/authentication_service.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User>();

    if (_firebaseUser != null) {
      return MainScreen();
    }

    return LoginScreen();
  }
}
