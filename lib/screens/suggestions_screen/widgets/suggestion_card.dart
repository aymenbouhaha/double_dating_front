import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/themes.dart';

class SuggestionCard extends StatelessWidget {
  SuggestionCard(
      {Key? key,
      required this.containerFunction,
      required this.addFunction,
      required this.datesNumber,
      required this.followersNumber,
      required this.coupleUsername})
      : super(key: key);

  String coupleUsername;
  int followersNumber;
  int datesNumber;
  void Function() addFunction;
  void Function() containerFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: containerFunction,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: addFunction,
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 35,
                  ),
                  color: AppColors.green,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  coupleUsername,
                  style: AppThemes.textStyle.copyWith(fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.group_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text("${followersNumber}",
                              style: AppThemes.textStyle.copyWith(fontSize: 12))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 15,
                          ),
                          Text("${datesNumber}",
                              style: AppThemes.textStyle.copyWith(fontSize: 12))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
