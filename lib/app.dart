import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
import 'services/authentication_service.dart';
import 'wrapper/authentication_wrapper.dart';

class App extends StatelessWidget {
  final _authenticationService = AuthenticationService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (ctx) => _authenticationService),
        StreamProvider(
            create: (ctx) => _authenticationService.authStateChanges),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (ctx) => AuthenticationWrapper(),
          '/login': (ctx) => LoginScreen(),
          '/home': (ctx) => MainScreen(),
        },
        theme: ThemeData(
          accentColor: Color.fromRGBO(25, 212, 238, 1),
          buttonColor: Color.fromRGBO(27, 38, 98, 1),
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Color.fromRGBO(249, 251, 255, 1.0),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
      ),
    );
  }
}
