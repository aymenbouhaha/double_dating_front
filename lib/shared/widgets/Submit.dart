import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/sign_up_screen/widgets/poppinstyle.dart';
import '../styles/colors.dart';

class Submit extends StatefulWidget {
    String text ;
  Submit({required this.text}) ;
  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  late String _text ;
  @override
  void initState() {
    super.initState() ;
    _text=widget.text ;
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {},
      child: Container(
        height: 70 ,
        width: 212 ,
        decoration: BoxDecoration
        (
          gradient: AppColors.fillGradient            ,
          borderRadius: BorderRadius.circular(80)     ,
        ) ,
        child: Center(
            child: Text(
                _text                    ,
                style: poppins.copyWith
                (
               fontSize: 18                               ,
               fontWeight: FontWeight.w600                ,
                )
            )
        ),
      ) ,
    ) ;
  }
}
