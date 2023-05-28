import 'package:double_dating_front/screens/sign_up_screen/widgets/poppinstyle.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DateField extends StatelessWidget {
  DateField({Key? key ,required this.onTap, required this.content}) : super(key: key);

  void Function() onTap;
  String content;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
            height: 50,
            width: width*0.8,
            decoration: BoxDecoration(
              color: Color(0xFF1B1142),
              border: AppColors.borderGradient,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width*0.65,
                    child: Text("${content}", style: poppins.copyWith(fontSize: 18, fontWeight: FontWeight.w400),)
                  ),
                  Icon(Icons.calendar_month,size: 25, color: Colors.white,)
                ],
              ),
            )),
      ),
    );
  }
}
