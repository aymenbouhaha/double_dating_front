import 'package:flutter/material.dart';

import '../../screens/sign_up_screen/widgets/poppinstyle.dart';
import '../styles/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.height ,required this.content, required this.width, required this.onTap}) : super(key: key);
  void Function() onTap;
  double height;
  double width;
  String content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: AppColors.fillGradient,
          borderRadius: BorderRadius.circular(80),
        ),
        child: Center(
            child: Text(content,
                style: poppins.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600))),
      ),
    );
  }
}
