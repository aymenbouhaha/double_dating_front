import 'package:double_dating_front/screens/sign_up_screen/widgets/poppinstyle.dart';
import 'package:double_dating_front/shared/widgets/Submit.dart';
import 'package:double_dating_front/shared/widgets/custom_button.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.backGroundGradient),
        child: Scaffold(
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
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height*0.1),
                  child: GradientText(
                    "Verification Code",
                    style: poppins.copyWith(fontSize: 35),
                    colors: [AppColors.roseBebe, AppColors.mauveClair],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Text(
                    "A verification code was sent to your email. Please enter it !",
                    textAlign: TextAlign.center,
                    style: poppins.copyWith(
                        fontWeight: FontWeight.w300, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.1, vertical: height*0.02),
                  child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle:
                          poppins.copyWith(color: Color(0xFF1B1142)),
                      length: 4,
                      textStyle: poppins.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 36),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 52,
                        fieldWidth: 52,
                        activeFillColor: Colors.white,
                      ),
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Color(0xFF1B1142),
                          blurRadius: 10,
                        )
                      ],
                      onChanged: (value) {
                        print(value);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height*0.03),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 17.0),
                        child: Text(
                          "Didn't recieve anything ?",
                          style: poppins.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w300),
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
                  ),
                ),
                CustomButton(
                    height: 60,
                    content: "Submit",
                    width: width * 0.5,
                    onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
