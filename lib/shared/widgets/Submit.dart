import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/sign_up_screen/widgets/poppinstyle.dart';
import '../styles/colors.dart';

class Submit extends StatelessWidget {
  Submit({Key? key, required this.text, required this.width, required this.height}) : super(key: key);

  String text;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: AppColors.fillGradient,
          borderRadius: BorderRadius.circular(80),
        ),
        child: Center(
            child: Text(text,
                style: poppins.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ))),
      ),
    );
  }
}

