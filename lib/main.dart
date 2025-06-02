import 'package:flutter/material.dart';
import 'package:sub_app/widget/subs.dart';
import 'package:sub_app/widget/topbottom.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFF141530),
        scaffoldBackgroundColor: Color(0xFFFF141530),
        brightness: Brightness.dark,
      ),
      home: BottomTop(),
    );
  }
}
