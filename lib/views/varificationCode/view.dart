import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/varificationCode/submit.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../constants.dart';



class VerificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  ListView(
        children: [
          SizedBox(
            height: height*.35,
              child: Image.asset("assets/images/vaCode.png")),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30),
            child: Text(LocaleKeys.verificationCode.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "dinnextl bold",
                fontSize:24,),),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30),
            child: Text(LocaleKeys.enterVerificationCode.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "dinnextl bold",
                color: kTextColor,
                fontSize:18,),),
          ),
          SizedBox(height: height*.07,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PinCodeTextField(
                autofocus: true,
                highlight: true,

                pinTextStyle:TextStyle(
                  fontFamily: "dinnextl bold",
                  fontSize:16,),
                pinBoxHeight: height * .08,
                pinBoxRadius: 5,
                onDone: (on) {

                },
                pinBoxWidth: height * .08,
                pinBoxBorderWidth: 1,
                errorBorderColor: Colors.red,
                pinBoxColor: Colors.white,
                highlightColor: kPrimaryColor,
                hasTextBorderColor: kPrimaryColor,
                pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 5),
                defaultBorderColor: Colors.white,
              ),
            ],
          ),
          SubmitVerification(),

        ],
      ),
    );
  }
}
