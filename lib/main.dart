import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_app/theme/custom_theme.dart';
import 'package:qr_code_app/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QR Code',
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      home: HomeScreen(),
    );
  }
}

