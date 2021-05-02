import 'package:aile/views/onBording/view.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:aile/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../constants.dart';

class SelectLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          Container(
            height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage( 'assets/images/splash.png'),
                  fit: BoxFit.cover,
                )
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: height * .1,
                  ),
                  CustomButton(
                    onPressed: () {
                      EasyLocalization.of(context).locale = Locale('en', 'US');
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => OnBoarding()));
                    },
                    title: "English",
                    color: Colors.white,
                  ),
                  CustomButton(
                    onPressed: () {
                      EasyLocalization.of(context).locale = Locale('ar', 'EG');
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => OnBoarding()));
                    },
                    title: "العربية",
                  ),
                ],
              )),

    );
  }
}
