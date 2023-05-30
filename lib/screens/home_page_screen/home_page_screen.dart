import 'package:double_dating_front/screens/conversations_screen/conversations_screen.dart';
import 'package:double_dating_front/screens/notifications_screen/notifications_screen.dart';
import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/themes.dart';
import '../search_screen/search_screen.dart';
import 'widgets/PostWidget.dart';
import '../../models/Couple.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  List<Post> posts = [
    Post(
        id: 1,
        caption: 'Our first trip together ❤️',
        creationDate: '2022-05-10T09:30:00.000Z',
        user: Couple(
          id: 1,
          username: 'john_and_jane',
          email: 'john_and_jane@gmail.com',
          anniversary: DateTime(2018, 5, 12),
        )),
    Post(
        id: 1,
        caption: 'Our first trip together ❤️',
        creationDate: '2022-05-10T09:30:00.000Z',
        user: Couple(
          id: 1,
          username: 'john_and_jane',
          email: 'john_and_jane@gmail.com',
          anniversary: DateTime(2018, 5, 12),
        )),
    Post(
        id: 1,
        caption: 'Our first trip together ❤️',
        creationDate: '2022-05-10T09:30:00.000Z',
        user: Couple(
          id: 1,
          username: 'john_and_jane',
          email: 'john_and_jane@gmail.com',
          anniversary: DateTime(2018, 5, 12),
        )),
    Post(
        id: 1,
        caption: 'Our first trip together ❤️',
        creationDate: '2022-05-10T09:30:00.000Z',
        user: Couple(
          id: 1,
          username: 'john_and_jane',
          email: 'john_and_jane@gmail.com',
          anniversary: DateTime(2018, 5, 12),
        ))
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.appBarColor,
            leading: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.search,size: 30,),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>SearchScreen())
                );
              },
            ),
            actions: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.notifications_outlined, size: 30,),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>NotificationsScreen())
                  );
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.message_outlined, size: 30,),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>ListConversation())
                  );
                },
              ),
              SizedBox(width: 10,)
            ],
            title: Text(
              "Home",
              style: AppThemes.textStyle.copyWith(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          body: ListView.builder(
            itemCount: widget.posts.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.all(8.0),
                  child: PostWidget(post: widget.posts[index]));
            },
          ),
        ),
      ),
    );;
  }
}

