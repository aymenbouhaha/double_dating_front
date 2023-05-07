

import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class ProfileIndicator extends StatelessWidget {
  ProfileIndicator({Key? key, required this.containerHeigth ,this.onTap, required this.containerWidth}) : super(key: key);

  double containerHeigth;
  double containerWidth;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: containerWidth,
        height: containerHeigth,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/Group 68.png"),
            ),
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
          ],
        ),
      ),
    );
  }
}
