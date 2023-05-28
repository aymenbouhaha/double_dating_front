import 'package:double_dating_front/screens/notifications_screen/widgets/likes_comments_card.dart';
import 'package:double_dating_front/screens/notifications_screen/widgets/request_card.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:double_dating_front/shared/styles/themes.dart';
import 'package:double_dating_front/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int index = 0;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
              context: context, leading: true, title: "Notifications"),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 20, bottom: 12),
                child: Row(
                  children: [
                    InkWell(
                      child: Text(
                        "Likes & Comments",
                        style: AppThemes.textStyle.copyWith(
                            fontSize: 18,
                            color: Colors.transparent,
                            decorationColor: index == 0 ? AppColors.roseBebe : Colors.white,
                            shadows: [Shadow(color : index == 0 ? AppColors.roseBebe : Colors.white, offset: Offset(0, -8))],
                            decoration: index== 0 ? TextDecoration.underline : TextDecoration.none,
                            decorationThickness: 2.5
                        ),
                      ),
                      onTap: () {
                        controller.animateToPage(0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      child: Text(
                        "Requests",
                        style: AppThemes.textStyle.copyWith(
                            fontSize: 18,
                            color: Colors.transparent,
                            decorationColor: index == 1 ? AppColors.roseBebe : Colors.white,
                            shadows: [Shadow(color : index == 1 ? AppColors.roseBebe : Colors.white, offset: Offset(0, -8))],
                            decoration: index== 1 ? TextDecoration.underline : TextDecoration.none,
                            decorationThickness: 2.5
                        ),
                      ),
                      onTap: () {
                        controller.animateToPage(1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      this.index = index;
                    });
                  },
                  controller: controller,
                  children: [
                    ListView.builder(
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              LikesCommentsCard(notifContent: "Myley Corbyn liked your postfzefzedz", notifDate: DateTime(2021,4,30,3,42)),
                              if(index<7)...[
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  height: 1.2,
                                  width: width*0.9,
                                  decoration: BoxDecoration(
                                      gradient: AppColors.fillGradient
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                              ]
                            ],
                          );
                        },
                      itemCount: 8,
                    ),
                    ListView.builder(
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            RequestCard(
                                acceptButtonFunction: (){},
                                notifDate: DateTime(2021,4,30,3,42),
                                cancelButtonFunction: (){},
                                senderName: "Myley Corbyn"
                            ),
                            if(index<7)...[
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 1.2,
                                width: width*0.9,
                                decoration: BoxDecoration(
                                    gradient: AppColors.fillGradient
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ]
                          ],
                        );
                      },
                      itemCount: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
