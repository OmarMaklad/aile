import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../constants.dart';

class ChangeLang extends StatefulWidget {
  @override
  _ChangeLangState createState() => _ChangeLangState();
}

class _ChangeLangState extends State<ChangeLang> {
  bool isSwitchedAr;
  bool isSwitchedEn;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (context.locale == Locale('en', 'US')) {
      setState(() {
        isSwitchedEn = true;
        isSwitchedAr = false;
      });
    } else {
      isSwitchedEn = false;
      isSwitchedAr = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          CustomAppBar(
            title:LocaleKeys.language.tr(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:20,vertical: 20) ,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Switch(
                      activeColor: kPrimaryColor,
                      activeTrackColor: kTextColor,
                      value: isSwitchedAr,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitchedAr = value;
                          if (isSwitchedAr == true) {
                            context.locale = Locale('ar', 'EG');
                            isSwitchedEn = false;
                          } else {
                            context.locale = Locale('en', 'US');
                            isSwitchedEn = true;
                          }
                        });
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: 15, top: 20, bottom: 20, left: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    "عربى",
                    style: TextStyle(
                        fontFamily: "dinnextl bold",
                        color: kPrimaryColor,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:20,vertical: 20) ,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Switch(
                    activeColor: kPrimaryColor,
                    activeTrackColor: kTextColor,
                    value: isSwitchedEn,
                    onChanged: (bool val) {
                      setState(() {
                        isSwitchedEn = val;
                        if (isSwitchedEn == true) {
                          context.locale = Locale('en', 'US');
                          isSwitchedAr = false;
                        } else {
                          context.locale = Locale('ar', 'EG');
                          isSwitchedAr = true;
                        }
                      });
                    },
                  ),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.only(
                        right: 15, top: 20, bottom: 20, left: 15),
                    child: Text(
                      "English",
                      style: TextStyle(
                          fontFamily: "dinnextl bold",
                          color: kPrimaryColor,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
