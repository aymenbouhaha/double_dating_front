import 'package:double_dating_front/screens/sign_up_screen/widgets/custom_text_field.dart';
import 'package:double_dating_front/screens/sign_up_screen/widgets/poppinstyle.dart';
import 'package:double_dating_front/screens/sign_up_screen/widgets/test.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:double_dating_front/shared/styles/themes.dart';
import 'package:double_dating_front/shared/widgets/custom_button.dart';
import 'package:double_dating_front/shared/widgets/date_field.dart';
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
        _datepickedString =
            "${_datepicked!.day}-${_datepicked!.month}-${_datepicked!.year}";
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset("assets/sign-up-bubble.svg" , height: 150, width: 150,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 23),
                  child: Text("Couple informations",
                      style: poppins.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 25)),
                ),
                CustomTextField(
                  hintText: "Username",
                  controller: usernameController,
                  obscureText: false,
                  icon: Icons.account_circle_outlined,
                ),
                CustomTextField(
                    hintText: "E-mail",
                    controller: emailController,
                    obscureText: false,
                    icon: Icons.alternate_email_outlined),
                CustomTextField(
                    hintText: "Password",
                    controller: passwordController,
                    obscureText: true,
                    icon: Icons.visibility_outlined),
                CustomTextField(
                    hintText: "Repeat Password",
                    controller: repeatPasswordController,
                    obscureText: true,
                    icon: Icons.visibility_outlined),
                DateField(
                    onTap: ()=>{
                      _ShowDatePicker()
                },
                    content: _datepickedString
                ),
                CustomButton(height: 60, width: width*0.5, onTap: (){}, content: "Continue",),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 17.0),
                      child: Text(
                        "You already have an account?",
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
