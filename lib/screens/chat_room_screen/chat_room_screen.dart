import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:double_dating_front/screens/chat_room_screen/widgets/chat_bar.dart';
import 'package:double_dating_front/screens/chat_room_screen/widgets/chat_bubble.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:double_dating_front/shared/styles/themes.dart';
import 'package:flutter/material.dart';


class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              // toolbarHeight: height*0.09,
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.grey, shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: Colors.black,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
              backgroundColor: AppColors.appBarColor,
              title: Row(
                children: [
                  Image.asset(
                    "assets/Group 68.png",
                    height: 45,
                    width: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Jack&Bella",
                        style: AppThemes.textStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                  )
                ],
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
              ],
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: height*0.11),
                  child: ListView.builder(
                    itemBuilder: (context,index){
                      bool isSender= index %2 ==0? true : false;
                      if(!isSender){
                        return Padding(
                          padding: const EdgeInsets.only(left: 14, top: 5, bottom: 5),
                          child: Stack(
                            children: [
                              Align(
                                child: ChatBubble(
                                    text: "What about blahblah blah blah because ...........  blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blahv blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blahvvvvv blahblah blah blah blahblah blah blah blahblah blah blahv",
                                    color: AppColors.appBarColor, isSender: false
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                              Image.asset("assets/Group 68.png" , height: 40,width: 40,),
                            ],
                          ),
                        );
                      }else{
                        return Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: ChatBubble(
                              text: "What about blahblah blah blah because ...........  blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blahv blahblah blah blah blahblah blah blah blahblah blah blah blahblah blah blahvvvvv blahblah blah blah blahblah blah blah blahblah blah blahv",
                              color: AppColors.appBarColor, isSender: true
                          ),
                        );
                      }
                    },
                    itemCount: 4,
                  ),
                ),

                ChatBar()
              ],
            ),
        ),
      ),
    );
  }
}


// ListView.builder(
// itemCount: 7,
// itemBuilder: (context, index) {
// return BubbleSpecialOne(
// color: AppColors.bubbleColor,
// text: "aymen" ,
// isSender: false,
// );
// }),