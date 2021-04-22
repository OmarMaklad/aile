import 'package:flutter/material.dart';
import '../../../constants.dart';

class CarouselContent extends StatelessWidget {
  final String image;
  final String txt;
  CarouselContent( this.image, this.txt);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.05),
          child: Image.asset("assets/images/${image}"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:30),
          child: Text(txt,
            style: TextStyle(
              fontSize:14,
              fontFamily: "dinnextl medium",
              color:kTextColor,),
            textAlign: TextAlign.center,),
        ),

      ],
    );
  }
}