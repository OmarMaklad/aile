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
      child: icon!=null?Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: (){Navigator.pop(context);},
                child: Icon(icon)),
        SizedBox(width: height*.16,),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle( fontFamily: "dinnextl bold", fontSize: 18),
          ),
        ),
          ],
        ),
      ):Row(
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
