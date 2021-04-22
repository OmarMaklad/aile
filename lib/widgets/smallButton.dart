import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../constants.dart';


class SmallButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  SmallButton({@required this.onPressed,@required this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical:5,horizontal:5),
        height: MediaQuery.of(context).size.height /16,
        width: MediaQuery.of(context).size.width /2.5,
        decoration: BoxDecoration(
          color:color==null?Colors.white:kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:kPrimaryColor,width: 1.5)
        ),
        child:  Center(
          child: Padding(
                padding:  EdgeInsets.only(bottom: 8),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontFamily: "dinnextl bold",
                  color:color==null?kPrimaryColor:Colors.white,
                  fontSize:18,),),
              ),
        ),
      ),
    );
  }
}
