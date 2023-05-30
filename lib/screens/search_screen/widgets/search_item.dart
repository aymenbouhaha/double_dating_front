import 'package:double_dating_front/models/Couple.dart';
import 'package:double_dating_front/models/interest.dart';
import 'package:double_dating_front/screens/conversations_screen/widgets/profile_indicator.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:double_dating_front/shared/styles/themes.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  SearchItem({Key? key}) : super(key: key);

  Couple couple=Couple(
    username: "Aymen_Emna",
    interest: [
      Interest(
        id: 1,
        name: "Music"
      ),
      Interest(
          id: 2,
          name: "Cooking"
      ),
      Interest(
          id: 3,
          name: "Swimming"
      ),
      Interest(
          id: 4,
          name: "Traveling"
      )
    ]
  );

  @override
  Widget build(BuildContext context) {

    List<String> interests=couple.interest!.map((e) => e.name!).toList();
    String interestsString = interests.join("  ");

    return Container(
      decoration: BoxDecoration(
        border: AppColors.borderGradient,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10)
      ),
      child:Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CircleAvatar(
              radius: 35,
              foregroundImage: AssetImage("assets/Group 68.png"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${couple.username}", style: AppThemes.textStyle.copyWith(fontSize: 20,color: Colors.white),),
                Text("Interests", style: AppThemes.textStyle.copyWith(fontSize: 18,color: Colors.white.withOpacity(0.5)),),
                Text("${interestsString}" , style: AppThemes.textStyle.copyWith(fontSize: 13, fontWeight: FontWeight.w300, color: AppColors.interestColor, overflow: TextOverflow.ellipsis ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
