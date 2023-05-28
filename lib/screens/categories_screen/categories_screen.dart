import 'package:double_dating_front/screens/categories_screen/widgets/gridview.dart';
import 'package:double_dating_front/screens/categories_screen/widgets/test.dart';
import 'package:double_dating_front/shared/widgets/Submit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../sign_up_screen/widgets/poppinstyle.dart';

class categoriesScreen extends StatefulWidget {
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  List<String> Interests = [
    "netflix",
    "Nature" ,
    "Traveling" ,
    "Art",
    "Video Games" ,
    "Parties" ,
    "Shopping" ,
    "Animals" ,
    "Cooking" ,
    "Films" ,
    "Books" ,
    "DIY & Crafts" ,
  ];
  Color colorBack=AppColors.appBarColor ;
  Color colorBorder=AppColors.appBarColor ;
  List<int> state=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] ;
   int? indexTap ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backGroundGradient,
        ),
        child: Column(
          children: [
            SizedBox(height: 30,) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20) ,
                      color: Color(0xFFCBC6F6),

                    ),
                    width: 44,
                    height: 44,
                    child: SvgPicture.asset('assets/icons/arrow_back.svg')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:20,bottom: 11.0),
              child: Text("Interests and Hobbies",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Text(
              "At least one choice is required",
              style: poppins.copyWith(fontSize: 14,fontWeight:FontWeight.w400,color: Colors.grey,),
            ),
            SizedBox(height: 36,) ,
            Row(
              children: [
                SizedBox(
                  width: 300,
                ),
                Text("Load more",
                    style: poppins.copyWith(
                        fontSize: 15, color: AppColors.roseBebe)),
              ],
            ),

            Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 35,
                        mainAxisSpacing: 37),
                    itemCount: Interests.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async{
                          setState(() {
                                    indexTap=index ;
                              }) ;
                            if(state[index]==0) {
                             setState(() {
                                   state[index]= 1 ;

                             });
                            }
                            else {
                              setState(() {
                                state[index]=0 ;

                                  });
                              }


                          } ,

                      child : (() {
                        if (state[index]==1) {
                            return GridViewCustom(color: Colors.black,colorBorder: Colors.red,text: Interests[index],);
                        } else {
                          return GridViewCustom(color: AppColors.appBarColor,colorBorder: AppColors.appBarColor,text: Interests[index],);
                        }
                      })() ,
) ;
    },

                ) ,),),

            Submit(text: "Continue"),
            // widget(child: Container())
          ],
        ),
      ),
    );
  }
}
