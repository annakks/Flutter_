import 'package:flutter/material.dart';
import 'package:test/page/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFF8A003C, {
        50: Color(0xFFFEE4E8),
        100: Color(0xFFFBB6C1),
        200: Color(0xFFF88A99),
        300: Color(0xFFF55D72),
        400: Color(0xFFF3304B),
        500: Color(0xFFCF4D6F),
        600: Color(0xFFCB3959),
        700: Color(0xFFC72443),
        800: Color(0xFFC3102D),
        900: Color(0xFFBF0C1B),
      })),
      home: LoginPage(),
    );
  }
}


