import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home.dart';
import 'package:food_delivery/pages/login.dart';
import 'pages/root.dart';
import 'theme/color.dart';

void main() {
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      home: LoginPage()
    );
  }

}