import 'package:flutter/material.dart';

import '../constants.dart';
class DoNotHave extends StatelessWidget {
  final String text;
  final String have;
  final Function route;
  final Color color;
   DoNotHave({ this.text, this.route, this.have, this.color});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal:30,vertical:10),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text( have,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "dinnextl bold",
                color: color==null?Colors.white:color,
              )
          ),
          SizedBox(width:5,),
          GestureDetector(
            onTap:route,
            child: Text(text,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "dinnextl bold",
                  color:Colors.purple,
                )
            ),
          ),
        ],
      ),
    );
  }
}
