import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import '../../shared/styles/colors.dart';
import '../sign_up_screen/widgets/custom.dart';
import '../sign_up_screen/widgets/poppinstyle.dart';

class PartnerInfo extends StatefulWidget {
  PartnerInfo({Key? key, required this.pageNumber}) : super(key: key);
  int pageNumber;

  @override
  State<PartnerInfo> createState() => _PartnerInfoState();
}

class _PartnerInfoState extends State<PartnerInfo> {
  DateTime? _datepicked;
  String _datepickedString = "Birth Date";
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  var _tabTextIconIndexSelected = 0;
  var _listTextTabToggle = ["Man", "Women"];

  void _ShowDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2015),
    ).then((value) {
      setState(() {
        _datepicked = value!;
        _datepickedString = _datepicked.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
          child: Column(
            children: [
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
                      child: InkWell(
                          onTap: () {
                            setState(() {

                            });
                          },
                          child :SvgPicture.asset('assets/icons/arrow_back.svg'))),
                ],
              ),

              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/sign_up_illustration.svg'),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Sign-up",
                      style: poppins.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 25),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 23),
                child: Text(
                    widget.pageNumber==1 ?  "First Partner Informations" : "Second Partner Informations",
                    style: poppins.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 25)),
              ),
              Container(
                decoration: BoxDecoration(
                  border: AppColors.borderGradient,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: FlutterToggleTab(
                  width: 80,
                  borderRadius: 50,
                  height: 52,
                  selectedIndex: _tabTextIconIndexSelected,
                  selectedBackgroundColors: [Color(0xFFDD3562)],
                  unSelectedBackgroundColors: [Color(0xFF1B1142)],
                  selectedTextStyle:
                      poppins.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
                  unSelectedTextStyle:   poppins.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
                  labels: _listTextTabToggle,
                  selectedLabelIndex: (index) {
                    setState(() {
                      _tabTextIconIndexSelected = index;
                    });
                  },
                  isScroll: false,
                ),
              ),
              SizedBox(height: 15) ,
              customContainer(
                hintText: "First Name",
                controller: usernameController,
                obscureText: false,
                iconpath: 'assets/icons/profile_rounded.svg',
              ),
              customContainer(
                  hintText: "Last Name",
                  controller: emailController,
                  obscureText: false,
                  iconpath: 'assets/icons/profile_rounded.svg'),
              customContainer(
                  hintText: "Phone Number",
                  controller: passwordController,
                  obscureText: false,
                  iconpath: 'assets/icons/phone.svg'),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 30.0, left: 34, right: 34),
                child: Container(
                  height: 50,
                  // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFF1B1142),
                    border: AppColors.borderGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: InkWell(
                    onTap: _ShowDatePicker,
                    child: ListTile(
                      leading: Text(
                        _datepickedString,
                        style: poppins.copyWith(
                            fontWeight: FontWeight.w300, fontSize: 18),
                      ),
                      trailing: SvgPicture.asset('assets/icons/Calendar.svg'),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                      if(widget.pageNumber==1){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PartnerInfo(pageNumber: 2,)));
                      }
                  });
                },
                child: Container(
                  height: 70,
                  width: 212,
                  decoration: BoxDecoration(
                    gradient: AppColors.fillGradient,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Center(
                      child: Text(widget.pageNumber == 1? "Continue" : "Sign Up" ,
                          style: poppins.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600))),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 17.0),
                    child: Text(
                      "You already have an account? ",
                      style: poppins.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "login !",
                        style: poppins.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFDD3562)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
