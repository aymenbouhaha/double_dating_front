import 'package:flutter/material.dart';

import '../../../shared/styles/themes.dart';

class LikesCommentsCard extends StatelessWidget {
  LikesCommentsCard({Key? key, required this.notifContent, required this.notifDate}) : super(key: key);

  String notifContent;
  DateTime notifDate;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Row(
        children: [
          Image.asset("assets/Group 68.png", height: 100,width: 100,),
          Container(
            width: width*0.68,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notifContent, style: AppThemes.textStyle.copyWith(fontSize: 15),),
                SizedBox(
                  height: 10,
                ),
                Text("${notifDate.hour}:${notifDate.minute} | ${notifDate.day}.${notifDate.month}.${notifDate.year}", style: AppThemes.textStyle.copyWith(fontSize: 12,color: Color.fromRGBO(255, 255, 255, 0.4)),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
