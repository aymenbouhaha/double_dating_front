import 'package:double_dating_front/bloc/authentication/sign_in_cubit.dart';
import 'package:double_dating_front/screens/controller/controller.dart';
import 'package:double_dating_front/screens/conversations_screen/conversations_screen.dart';
import 'package:double_dating_front/screens/sign_up_screen/sign_up_screen.dart';
import 'package:double_dating_front/shared/styles/colors.dart';
import 'package:double_dating_front/shared/styles/themes.dart';
import 'package:double_dating_front/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../sign_up_screen/widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
      child: Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: BlocConsumer<SignInCubit,SignInState>(
            listener: (context,state){
                if(state is SignInError){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.message}", style: AppThemes.textStyle.copyWith(color: Colors.white,fontSize: 15),)));
                }
                if(state is SignInSuccessState){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=> Controller())
                  );
                }
            },
            builder: (context, state){
              if(state is SignInLoadingState)
                return Center(
                  child: CircularProgressIndicator(),
                );

              return Column(
                children: [
                  SvgPicture.asset("assets/sign-in-bubble.svg"),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomTextField(
                      hintText: "E-mail or Username",
                      controller: emailController,
                      obscureText: false,
                      icon: Icons.alternate_email_outlined),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextField(
                      hintText: "Password",
                      controller: passwordController,
                      obscureText: true,
                      icon: Icons.visibility_outlined),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomButton(
                      height: 60,
                      content: "Continue",
                      width: width * 0.5,
                      onTap: () {
                        print("Haha");
                        context.read<SignInCubit>().login(emailController.value.text, passwordController.value.text);
                        emailController.clear();
                        passwordController.clear();
                      }
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 17.0),
                        child: Text(
                          "You already have an account?",
                          style: AppThemes.textStyle
                              .copyWith(fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => SignUp()));
                          },
                          child: Text(
                            "Create Account!",
                            style: AppThemes.textStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFDD3562)),
                          )),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
