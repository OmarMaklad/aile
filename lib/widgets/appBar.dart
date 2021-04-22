import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;

  CustomAppBar({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .12,
      width: double.infinity,
      padding: EdgeInsets.only(top: height * .05),
      decoration: BoxDecoration(
          color:Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft:Radius.circular(40),
            bottomRight:Radius.circular(40) )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text(
        title,
        style: TextStyle( fontFamily: "dinnextl bold", fontSize: 18),
      ),
        ],
      ),
    );
  }
}
