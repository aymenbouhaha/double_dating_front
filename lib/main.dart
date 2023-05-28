import 'package:double_dating_front/screens/categories_screen/categories_screen.dart';
import 'package:double_dating_front/screens/code_verification_screen/code_verification_screen.dart';
import 'package:double_dating_front/screens/partner_info_screen/partner_info_screen.dart';
import 'package:double_dating_front/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Double_Dating_App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: categoriesScreen(),
    );
  }
}
