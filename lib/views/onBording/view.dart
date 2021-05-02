import 'package:aile/constants.dart';
import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/home/bloc/cubit.dart';
import 'package:aile/views/login/view.dart';
import 'package:aile/views/onBording/widgets/carousel_indicator.dart';
import 'package:aile/views/onBording/widgets/page_view.dart';
import 'package:aile/views/tabsScreen/view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cubit.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _pageController = PageController();
  int pageIndex = 0;

  void onPressed() {
    if (pageIndex < 1) {
      setState(() {
        pageIndex++;
      });
      _pageController.animateToPage(pageIndex,
          curve: Curves.easeInCirc, duration: Duration(milliseconds: 500));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (_) => OnBoardCubit()
        ..getOnBoard(lang: EasyLocalization.of(context).locale == Locale('en', 'US') ? "en" : "ar"),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: height * 1,
          color: kPrimaryColor,
          child: Column(
            children: [
              Container(
                height: height * .75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )),
                child: Carousel(_pageController),
              ),
              CarouselIndicator(pageIndex),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => TabsScreen()));
                },
                child: Text(
                  EasyLocalization.of(context).locale == Locale('en', 'US')
                      ? "Login as Visitor"
                      : "الدخول كزائر",
                  style: TextStyle(
                    fontFamily: "dinnextl bold",
                    color: Colors.deepPurple,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: height * .1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        LocaleKeys.skip.tr(),
                        style: TextStyle(
                            fontFamily: "dinnextl medium",
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ),
                    GestureDetector(
                        onTap: onPressed,
                        child: Text(
                          LocaleKeys.next.tr(),
                          style: TextStyle(
                              fontFamily: "dinnextl medium",
                              color: Colors.white,
                              fontSize: 18),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
