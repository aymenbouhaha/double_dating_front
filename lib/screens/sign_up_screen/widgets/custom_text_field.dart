import 'package:double_dating_front/screens/sign_up_screen/widgets/poppinstyle.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;
  const CustomTextField(
      {required this.hintText,
      required this.controller,
      required this.obscureText,
      required this.icon});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
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
                  child: TextFormField(
                    style: poppins.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w400),
                    controller: controller,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: poppins.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Icon(icon,size: 25, color: Colors.white,)
              ],
            ),
          )),
    );
  }
}
