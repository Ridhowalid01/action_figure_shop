import 'package:action_figure_shop/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Action Figure Shop',
      theme: ThemeData(),
      home: MainScreen(),
      // home: DetailScreen(),
    );
  }
}
