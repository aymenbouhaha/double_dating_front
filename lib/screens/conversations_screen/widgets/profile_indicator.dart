

import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class ProfileIndicator extends StatelessWidget {
  ProfileIndicator({Key? key, required this.containerHeigth ,required this.isConnected, this.imageData ,this.onTap, required this.containerWidth}) : super(key: key);

  double containerHeigth;
  double containerWidth;
  Uint8List? imageData;
  bool isConnected;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    ImageProvider foreground;

    if(imageData !=null){
      foreground=MemoryImage(imageData!);
    }else{
      foreground=AssetImage("assets/Group 68.png");
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        width: containerWidth,
        height: containerHeigth,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 35,
                foregroundImage: foreground,
              ),
            ),
            if(this.isConnected)...[
              Positioned(
                bottom: 15,
                right: 10,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: AppColors.green,
                      shape: BoxShape.circle),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
