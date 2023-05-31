import 'package:double_dating_front/models/interest.dart';
import 'package:double_dating_front/screens/suggestions_screen/widgets/suggestion_card.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:double_dating_front/shared/widgets/app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../models/couple.dart';
import '../../shared/styles/themes.dart';

class SuggestionsScreen extends StatefulWidget {
  SuggestionsScreen({Key? key}) : super(key: key);

  List<Couple> couples = [
    Couple(username: "Aymen&Emna"),
    Couple(username: "Roua&Wadii"),
    Couple(username: "Ahmed&Deliya"),
    Couple(username: "Nour&Imed"),
    Couple(username: "Joo&Titi"),
  ];
  List<int> followers = [12, 36, 96, 63, 45];
  List<int> dates = [6, 33, 8, 9, 20];
  List<Interest> interests = [
    // Interest(name: "Sex"),
    Interest(name: "Love"),
    Interest(name: "Camping"),
    Interest(name: "Feelings"),
    Interest(name: "Flirting"),
  ];
  List<String> interest=[
    "All",
    // "Sex",
    "Love",
    "Camping",
    "Feelings",
    "Flirting"
  ];


  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  String? selectedValue="All";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(title: "Suggestions", leading: false, context: context),
            body: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Couples you may match",
                    style: AppThemes.textStyle
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8,top: 8,bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text(
                              '${selectedValue}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items:
                            widget.interest
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 34,
                              width: 160,
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: AppColors.borderGradient,
                                color: Colors.black,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                              ),
                              iconSize: 25,
                              iconEnabledColor: Colors.white,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 160,
                              padding: null,
                              decoration: BoxDecoration(
                                border: AppColors.borderGradient,
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.black,
                              ),
                              elevation: 8,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            "Filter",
                          style: AppThemes.textStyle.copyWith(color: AppColors.roseBebe, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.86,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: widget.couples.length,
                        itemBuilder: (context, index) {
                          return SuggestionCard(
                              containerFunction: () {},
                              addFunction: () {},
                              datesNumber: widget.dates[index],
                              followersNumber: widget.followers[index],
                              coupleUsername: widget.couples[index].username!);
                        }),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
