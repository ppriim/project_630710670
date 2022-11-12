import 'package:flutter/material.dart';
import 'package:project_630710670/pages/homepage.dart';
import 'package:project_630710670/pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const loginPage(),
    );
  }
}
