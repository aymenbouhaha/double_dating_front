import 'dart:typed_data';

import 'package:double_dating_front/screens/conversations_screen/widgets/profile_indicator.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/themes.dart';

class ConversationItem extends StatefulWidget {
  ConversationItem({Key? key , required this.username,this.imageData,required this.onTap, required this.lastMessage, required this.date , required this.notReadMessages}) : super(key: key);

  int notReadMessages;
  String username;
  String lastMessage;
  DateTime date;
  Uint8List? imageData;
  void Function() onTap;

  @override
  State<ConversationItem> createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 68;
    Color itemsColor= widget.notReadMessages>0? AppColors.roseBebe : Colors.white;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: width*0.9,
        height: width10*8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileIndicator(isConnected: false,imageData: widget.imageData,containerHeigth: width*0.24, containerWidth: width*0.24),
            Container(
              width: width*0.6,
              height: width10*7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.username , style: AppThemes.textStyle.copyWith(fontSize: width10*2 , color: itemsColor),),
                      Text("${widget.date.hour>=10?widget.date.hour : "0${widget.date.hour}"}:${widget.date.minute>=10?widget.date.minute : "0${widget.date.minute}"}" , style: AppThemes.textStyle.copyWith(fontSize: width10*1.4, fontWeight: FontWeight.w400 , color: itemsColor),)
                    ],
                  ),
                  Container(child: Text(widget.lastMessage, style: AppThemes.textStyle.copyWith(fontSize: width10*1.5 , fontWeight:FontWeight.w400 ,color: itemsColor), overflow: TextOverflow.ellipsis,))
                ],
              ),
            ),
            SizedBox(
              width: width10*1.7,
            ),
            if (widget.notReadMessages >0)...[
              Container(
                height: height10*2.4,
                width: width10*4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.roseBebe,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Text("+${widget.notReadMessages}", style: AppThemes.textStyle.copyWith(fontSize: width10*1.5,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
              )
            ]
          ],
        ),
      ),
    );;
  }
}
