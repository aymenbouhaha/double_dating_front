
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/themes.dart';

AppBar CustomAppBar({required BuildContext context,required bool leading ,required String title}){

  return AppBar(
    leading: leading ? InkWell(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.grey,
              shape: BoxShape.circle
          ),
          child: Icon(Icons.arrow_back_ios_new,size: 20,color: Colors.black,),
          alignment: Alignment.center,
        ),
      ),
    ) : null,
    backgroundColor: AppColors.appBarColor,
    centerTitle: true,
    title: Text("${title}",
        style: AppThemes.textStyle.copyWith(fontSize: 23)),
  );

}
