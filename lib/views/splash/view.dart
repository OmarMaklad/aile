import 'dart:async';
import 'package:aile/views/home/view.dart';
import 'package:aile/views/memberHome/view.dart';
import 'package:aile/views/selectLanguage/view.dart';
import 'package:aile/views/tabsScreen/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';


class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Widget route;
  @override
  void initState() {
    _logged();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => route)));
    super.initState();
  }
  void _logged()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if(_prefs.getString("token") != null && _prefs.getString('type') !=null){
      route =  _prefs.getString('type') == "user"?TabsScreen():MemberHome();
    }else{
      route = SelectLanguage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Image.asset(
                'assets/images/splash.png',
            fit: BoxFit.cover,
          )),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height*.2,
              child: FadeInImage(
                fadeInCurve: Curves.decelerate,
                fadeInDuration: Duration(seconds: 1),
                fadeOutDuration: Duration(seconds: 1),
                placeholder:AssetImage('assets/images/logo.png',),
                image: AssetImage('assets/images/logo.png'),
                height: sizeFromHeight(context, 2, removeAppBarSize: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
