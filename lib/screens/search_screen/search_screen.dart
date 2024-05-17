import 'package:double_dating_front/screens/search_screen/widgets/search_item.dart';
import 'package:flutter/material.dart';
import '../../models/Couple.dart';
import '../../shared/styles/colors.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Couple> couples = [
    Couple(username: 'John & Jane'),
    Couple(username: 'David & Emily'),
    Couple(username: 'Michael & Sarah'),
    Couple(username: 'Chris & Emma'),
  ];

  List<Couple> filteredCouples = [];

  void searchCouple(String query) {
    setState(() {
      filteredCouples = couples
          .where((couple) =>
          couple.username!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child:
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.appBarColor,
            leading: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.grey,
                      shape: BoxShape.circle
                  ),
                  child: Icon(Icons.arrow_back_ios_new,size: 20,color: Colors.black,),
                  alignment: Alignment.center,
                ),
              ),
            ),
            title: Container(
              height: 40,
              child: TextField(
                onChanged: (value) {
                  searchCouple(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white54,
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: SearchItem(),
              );
            },
          ),
        ));
  }
}
