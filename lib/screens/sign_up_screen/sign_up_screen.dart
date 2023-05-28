import 'package:double_dating_front/screens/sign_up_screen/widgets/custom.dart';
import 'package:double_dating_front/screens/sign_up_screen/widgets/poppinstyle.dart';
import 'package:double_dating_front/screens/sign_up_screen/widgets/test.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  DateTime? _datepicked;
  String _datepickedString = "Anniversary";
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  void _ShowDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _datepicked = value!;
        _datepickedString = "${_datepicked!.day}-${_datepicked!.month}-${_datepicked!.year}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/sign_up_illustration.svg'),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Sign-up",
                        style: poppins.copyWith(fontWeight: FontWeight.w600,fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 23),
                  child: Text("Couple informations",
                      style: poppins.copyWith(fontWeight:FontWeight.w700,fontSize: 25)),
                ),
                customContainer(
                    hintText: "Username",
                    controller: usernameController,
                    obscureText: false ,
                    iconpath: 'assets/icons/profile_rounded.svg',
                ),
                customContainer(
                    hintText: "E-mail",
                    controller: emailController,
                    obscureText: false,
                    iconpath: 'assets/icons/alt.svg'
                ),
                customContainer(
                    hintText: "password",
                    controller: passwordController,
                    obscureText: true,
                    iconpath: 'assets/icons/eye.svg'
                ),
                customContainer(
                    hintText: "Repeat Password",
                    controller: repeatPasswordController,
                    obscureText: true ,
                    iconpath: 'assets/icons/eye.svg'
                ),
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
                  onTap: () {},
                  child: Container(
                    height: 70,
                    width: 212,
                    decoration: BoxDecoration(
                      gradient: AppColors.fillGradient,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Center(
                        child: Text("Continue",
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
      ),
    );
  }
}
