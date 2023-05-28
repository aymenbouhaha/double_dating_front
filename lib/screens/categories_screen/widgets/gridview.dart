import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../sign_up_screen/widgets/poppinstyle.dart';

class GridViewCustom extends StatelessWidget {
  final Color color ;
  final Color colorBorder ;
  final String text ;
  const GridViewCustom({required this.color,required this.colorBorder,required this.text}) ;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorBorder),
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
