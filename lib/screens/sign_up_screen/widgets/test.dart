import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  final String text;

  const CustomContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0,left: 34,right: 34),
      child: Container(
        height: 50,
       // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFF1B1142),
          border: AppColors.borderGradient,
          borderRadius: BorderRadius.circular(20),
          /*boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],

           */
        ),
        child: ListTile(
          leading :Text(
            text,
            style: TextStyle(fontSize: 20,fontFamily: "Poppins",color: Colors.white),
          ),
          trailing: SvgPicture.asset('assets/icons/eye.svg'),
        ) ,

        ),
      ) ;

  }
}

