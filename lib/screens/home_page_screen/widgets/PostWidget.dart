import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../models/post.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/styles/themes.dart';



class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({required this.post});

  final TextStyle usernameStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 68;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.postBackground
      ),
      width: width*0.9,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Post_Holdings_logo.svg/1200px-Post_Holdings_logo.svg.png"
                    // post.user?.imageUrl ?? ""
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.user?.username ?? "", style:AppThemes.textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),),
                    Text(post.creationDate?? "" , style:AppThemes.textStyle.copyWith(fontWeight: FontWeight.w100, color: Colors.white.withOpacity(0.5), fontSize: 12),),
                  ],
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, size: 30,), padding: EdgeInsets.zero, color: Colors.white,)
            ],
          ),
          SizedBox(height: 10.0),
          Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Post_Holdings_logo.svg/1200px-Post_Holdings_logo.svg.png"
              // post.url.toString()
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon:SvgPicture.asset(
                      'assets/icons/like.svg',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      // Perform like action
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/comment.svg', // Replace with your SVG file path
                      width: 24, // Set the desired width
                      height: 24,),
                    onPressed: () {
                      // Perform comment action
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/resend.svg', // Replace with your SVG file path
                      width: 24, // Set the desired width
                      height: 24,),
                    onPressed: () {
                      // Perform share action
                    },
                  ),
                ],
              ),
              Text('455 Likes, 60 comments', style: AppThemes.textStyle.copyWith(fontWeight: FontWeight.w100,fontSize: 14),)
            ],
          ),
          SizedBox(height: 10.0),
          Text.rich(
              TextSpan(
                text: "${post.user!.username} :",
                style: AppThemes.textStyle.copyWith(fontSize: 18,fontWeight: FontWeight.w900),
                children: [
                  TextSpan(
                    text: " ${post.caption} fezfeffef",
                    style: AppThemes.textStyle.copyWith(fontSize: 15,fontWeight: FontWeight.w200)
                  )
                ]
              ),
            style: TextStyle(overflow: TextOverflow.ellipsis,),

          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              // Navigate to comments page
            },
            child: Row(
              children: [
                Icon(Icons.visibility_outlined, color: Colors.white,),
                SizedBox(
                  width: 9,
                ),
                Text('see comments', style: AppThemes.textStyle.copyWith(fontWeight: FontWeight.w200, fontSize: 13),textAlign: TextAlign.center,),
              ],
            ),),
        ],
      ),
    );
  }
}
