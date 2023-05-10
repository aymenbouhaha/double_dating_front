import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/themes.dart';

class RequestCard extends StatelessWidget {
  RequestCard({Key? key, required this.acceptButtonFunction , required this.notifDate, required this.cancelButtonFunction, required this.senderName}) : super(key: key);

  String senderName;
  DateTime notifDate;
  void Function() cancelButtonFunction;
  void Function() acceptButtonFunction;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Image.asset("assets/Group 68.png", height: 100,width: 100,),
          Container(
            width: width*0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${senderName}\nsent you an inviation" , style: AppThemes.textStyle.copyWith(fontSize: 15),),
                SizedBox(
                  height: 10,
                ),
                Text("${notifDate.hour}:${notifDate.minute} | ${notifDate.day}.${notifDate.month}.${notifDate.year}", style: AppThemes.textStyle.copyWith(fontSize: 12,color: Color.fromRGBO(255, 255, 255, 0.4)),)
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: acceptButtonFunction,
                icon: Icon(Icons.check_circle_outline, color: AppColors.green,size: 45,),
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
              ),
              IconButton(
                alignment: Alignment.center,
                onPressed: cancelButtonFunction,
                icon: Icon(Icons.cancel_outlined,color: AppColors.red,size: 45),
                padding: EdgeInsets.all(0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
