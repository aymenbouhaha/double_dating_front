import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:double_dating_front/shared/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/services/services.dart';
import '../../shared/styles/themes.dart';

class ProfileImageUpload extends StatefulWidget {
  const ProfileImageUpload({Key? key}) : super(key: key);

  @override
  State<ProfileImageUpload> createState() => _ProfileImageUploadState();
}

class _ProfileImageUploadState extends State<ProfileImageUpload> {



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              foregroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.arrow_back_ios_new,size: 20,color: Colors.black,),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Add You Profile\nPicture" ,textAlign: TextAlign.center, style: AppThemes.textStyle.copyWith(fontSize: 30 , fontWeight: FontWeight.w900),),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        Services.getImage();
                      },
                      child: Container(
                        width: width*0.8,
                        height: width*0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: AppColors.borderGradient,
                          color: Colors.black,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo_outlined, size: 80, color: HexColor("#4C407B"),),
                            SizedBox(height: 5,),
                            GradientText("Upload Picture", gradient: AppColors.fillGradient , style: AppThemes.textStyle.copyWith(fontSize: 20),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center,
                        width: width*0.45,
                        height: 65,
                        decoration: BoxDecoration(
                          gradient: AppColors.fillGradient,
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text("Continue", style: AppThemes.textStyle.copyWith(fontSize: 20),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
