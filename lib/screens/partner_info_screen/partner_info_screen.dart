import 'package:double_dating_front/bloc/authentication/sign_up_cubit.dart';
import 'package:double_dating_front/screens/sign_in_screen/sing_in_screen.dart';
import 'package:double_dating_front/shared/widgets/custom_button.dart';
import 'package:double_dating_front/shared/widgets/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/themes.dart';
import '../sign_up_screen/widgets/custom_text_field.dart';
import '../sign_up_screen/widgets/poppinstyle.dart';

class PartnerInfo extends StatefulWidget {
  PartnerInfo({Key? key, required this.pageNumber, this.coupleInofs, this.firstPersonInfo}) : super(key: key);
  int pageNumber;
  Map<String , dynamic>? coupleInofs;
  Map<String, dynamic>? firstPersonInfo;

  @override
  State<PartnerInfo> createState() => _PartnerInfoState();
}

class _PartnerInfoState extends State<PartnerInfo> {
  DateTime? _datepicked;
  String _datepickedString = "Birth Date";
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  var _tabTextIconIndexSelected = 0;
  var _listTextTabToggle = ["Man", "Women"];

  void _ShowDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _datepicked = value!;
        _datepickedString = _datepicked.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child: BlocConsumer<SignUpCubit,SignUpState>(
            listener: (context,state){
              if (state is SignUpSuccessState){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=>SignInScreen())
                );
              }
              if(state is SignUpErrorState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.message}", style: AppThemes.textStyle.copyWith(color: Colors.white,fontSize: 15),)));
              }
            },
            builder: (context, state) {
              if (state is SignUpLoadingState){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Scaffold(
                appBar: AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.grey, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/sign-up-bubble.svg",
                        height: 150,
                        width: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                            widget.pageNumber == 1
                                ? "First Partner Informations"
                                : "Second Partner Informations",
                            style: poppins.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 25)),
                      ),
                      Container(
                        width: width*0.8,
                        decoration: BoxDecoration(
                          border: AppColors.borderGradient,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FlutterToggleTab(
                          width: 80,
                          borderRadius: 100,
                          height: 50,
                          selectedIndex: _tabTextIconIndexSelected,
                          selectedBackgroundColors: [Color(0xFFDD3562)],
                          unSelectedBackgroundColors: [Color(0xFF1B1142)],
                          selectedTextStyle: poppins.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 15),
                          unSelectedTextStyle: poppins.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 15),
                          labels: _listTextTabToggle,
                          selectedLabelIndex: (index) {
                            setState(() {
                              _tabTextIconIndexSelected = index;
                            });
                          },
                          isScroll: false,
                        ),
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        hintText: "First Name",
                        controller: firstNameController,
                        obscureText: false,
                        icon: Icons.account_circle_outlined,
                      ),
                      CustomTextField(
                        hintText: "Last Name",
                        controller: lastNameController,
                        obscureText: false,
                        icon: Icons.account_circle_outlined,
                      ),
                      CustomTextField(
                          hintText: "Phone Number",
                          controller: phoneNumberController,
                          obscureText: false,
                          icon: Icons.phone_outlined),
                      DateField(
                          onTap: () => {_ShowDatePicker()},
                          content: _datepickedString),
                      CustomButton(
                          content: widget.pageNumber == 1 ? "Continue" : "Sign Up",
                          height: 60,
                          width: width * 0.5,
                          onTap: () {
                            dynamic partnerInfos={
                              "firstName": firstNameController.value.text,
                              "lastName": lastNameController.value.text,
                              "phoneNumber":phoneNumberController.value.text,
                              "birthDate": _datepicked!.toUtc().toIso8601String()
                            };
                            if (widget.pageNumber == 1) {

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PartnerInfo(
                                    pageNumber: 2,
                                    firstPersonInfo: partnerInfos,
                                    coupleInofs: widget.coupleInofs,
                                  )));
                            }else{
                              dynamic data={
                                ...widget.coupleInofs!,
                                "firstPartner" : widget.firstPersonInfo,
                                "secondPartner" : partnerInfos
                              };
                              context.read<SignUpCubit>().signUp(data: data);
                            }
                          }
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.05 , vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "You already have an account?",
                              style: poppins.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w300),
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
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
        ),
      ),
    );
  }
}
