import 'package:double_dating_front/screens/chat_room_screen/chat_room_screen.dart';
import 'package:double_dating_front/screens/controller/controller.dart';
import 'package:double_dating_front/screens/conversations_screen/conversations_screen.dart';
import 'package:double_dating_front/screens/notifications_screen/notifications_screen.dart';
import 'package:double_dating_front/screens/profile_image_upload_screen/profile_image_upload_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:ChatRoomScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


