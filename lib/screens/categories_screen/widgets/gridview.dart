import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import '../../sign_up_screen/widgets/poppinstyle.dart';

class GridViewCustom extends StatelessWidget {
  final Color color ;
  final String text ;
  bool selected;
  GridViewCustom({required this.color,required this.text,required this.selected }) ;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          border: selected? Border.all(color: Colors.black): AppColors.borderGradient,
            borderRadius: BorderRadius.circular(20),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
              )
            ]),
        child: Center(
            child: Text(
              text,
              style:poppins.copyWith(color: Colors.white,fontSize: 11),
            )),
      ) ;
}
}
