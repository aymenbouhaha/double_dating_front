import 'package:double_dating_front/screens/conversations_screen/widgets/conversation_item.dart';
import 'package:double_dating_front/screens/conversations_screen/widgets/profile_indicator.dart';
import 'package:double_dating_front/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class ListConversation extends StatefulWidget {
  const ListConversation({Key? key}) : super(key: key);

  @override
  State<ListConversation> createState() => _ListConversationState();
}

class _ListConversationState extends State<ListConversation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 68;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
              context: context, leading: true, title: "Conversations"),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                alignment: Alignment.center,
                child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProfileIndicator(containerHeigth: width10*9, containerWidth: width10*9,onTap: (){},);
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: width10 * 0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: width * 0.9,
                      decoration:
                          BoxDecoration(gradient: AppColors.fillGradient),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return ConversationItem(
                          username: "Aymen_Emna",
                          lastMessage: "You : mahlekom chabeb nhebkom",
                          date: DateTime(2022, 1, 1, 20, 28),
                          notReadMessages: 0,
                        onTap: (){},
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

