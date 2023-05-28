import 'dart:ffi';

import 'package:double_dating_front/screens/categories_screen/widgets/gridview.dart';
import 'package:double_dating_front/shared/widgets/Submit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../sign_up_screen/widgets/poppinstyle.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<String> Interests = [
    "netflix",
    "Nature",
    "Traveling",
    "Art",
    "Video Games",
    "Parties",
    "Shopping",
    "Animals",
    "Cooking",
    "Films",
    "Books",
    "DIY & Crafts",
    "Sex",
    "Nature",
    "Beauty",
    "Planning",
    "a",
    "b",
    "s",
    "v",
    "zefz",
    "feazg",
    "zegez",
    "gzgez",
    "hheer",
    "herip",
    "gaegze",
    "gezgzphz",
    "gzegzeg",

  ];
  Color colorBack = AppColors.appBarColor;
  Color colorBorder = AppColors.appBarColor;
  List<int> state = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  int? indexTap;
  int itemsNumber=9;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.backGroundGradient
      ),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body:SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                leading: Padding(
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
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: Text("Interests and Hobbies",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 27,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              Text(
                "At least one choice is required",
                style: poppins.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              InkWell(
                onTap: (){
                  print(itemsNumber);
                  print(Interests.length);
                  print(Interests);
                  setState(() {
                    if(itemsNumber+9<=Interests.length){
                      itemsNumber+=9;
                    }else{
                      itemsNumber=Interests.length;
                    }
                  });
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20,top: 10),
                    child: Text("Load more",
                        style: poppins.copyWith(
                            fontSize: 15, color: AppColors.roseBebe)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 35,
                      mainAxisSpacing: 37
                  ),
                  itemCount: itemsNumber,
                  itemBuilder: (context, index) {

                    return InkWell(
                      onTap: (){
                        setState(() {
                          indexTap = index;
                        });
                        if (state[index] == 0) {
                          setState(() {
                            state[index] = 1;
                          });
                        } else {
                          setState(() {
                            state[index] = 0;
                          });
                        }
                      },
                      child: (() {
                        if (state[index] == 1) {
                          return GridViewCustom(
                            selected: false,
                            color: Colors.black,
                            text: Interests[index],
                          );
                        } else {
                          return GridViewCustom(
                            selected: true,
                            color: AppColors.appBarColor,
                            text: Interests[index],
                          );
                        }
                      })(),
                    );
                  },
                ),
              ),
              Submit(text: "Continue", width: width*0.4, height: 60,),
              SizedBox(
                height: 20,
              )
              // widget(child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
