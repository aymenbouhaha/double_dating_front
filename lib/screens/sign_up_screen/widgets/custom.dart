import 'package:double_dating_front/screens/sign_up_screen/widgets/poppinstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/styles/colors.dart';

class customContainer extends StatelessWidget {
  final controller ;
  final String hintText ;
  final bool obscureText ;
  final String iconpath ;
  const customContainer({required this.hintText,required this.controller,required this.obscureText,required this.iconpath } );

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20.0,left: 34,right: 34),
      child: Container(
          height: 50,
          // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFF1B1142),
            border: AppColors.borderGradient,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
          Row (children: [
            Container(
              width: 200,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    style: poppins.copyWith(fontSize: 18,fontWeight: FontWeight.w400),
                    controller: controller ,
                    obscureText: obscureText ,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: poppins.copyWith(fontSize: 18,fontWeight: FontWeight.w400),
                    ) ,

                  ),
                ),
              ),
            ) ,
            Padding(
              padding: const EdgeInsets.only(left: 85.0),
              child: SvgPicture.asset(iconpath),
            ),
          ],)


      ),
    ) ;

  }
}
