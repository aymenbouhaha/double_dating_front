import 'package:double_dating_front/screens/sign_up_screen/widgets/poppinstyle.dart';
import 'package:double_dating_front/shared/widgets/Submit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../shared/styles/colors.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({Key? key}) : super(key: key);

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
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
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFCBC6F6),
                      ),
                      width: 44,
                      height: 44,
                      child: SvgPicture.asset('assets/icons/arrow_back.svg')),
                ],
              ),
              SizedBox(height: 100),
              GradientText(
                "Verification Code",
                style: poppins.copyWith(fontSize: 35),
                colors: [AppColors.roseBebe, AppColors.mauveClair],
              ),
              SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.only(right: 70.0,left: 70.0),
                child: Text("A verification code was sent to your email . Please enter it !",textAlign: TextAlign.center,
                style: poppins.copyWith(fontWeight: FontWeight.w300,fontSize: 15),),
              ) ,
              Padding(
                padding: const EdgeInsets.only(top: 34.0,left:57,right: 57,bottom: 30 ),
                child: PinCodeTextField(
                    appContext: context ,
                    pastedTextStyle: poppins.copyWith(color: Color(0xFF1B1142)) ,
                    length: 4           ,
                    textStyle: poppins.copyWith(fontWeight: FontWeight.w400,fontSize: 36),

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 52,
                      fieldWidth: 52,
                    activeFillColor: Colors.white,),
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Color(0xFF1B1142),
                        blurRadius: 10,

                      )
                    ],
                      onChanged: (value) {print(value) ;}),
              ) ,


              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 17.0),
                    child: Text(
                      "Didn't recieve anything ?",
                      style: poppins.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend code !",
                        style: poppins.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFDD3562)),
                      )),
                ],
              ) ,
              SizedBox(height: 30) ,
              Submit(text: 'submit',) ,

            ],
          ),
        ),
      ),
    );
  }
}
