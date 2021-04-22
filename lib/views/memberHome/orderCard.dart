import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/orderDetails/view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../constants.dart';
class OrderCard extends StatelessWidget {
  final String  from;
  final String  location;
  final String  start;
  final int  id;
  final String  end;

  const OrderCard({Key key, this.from, this.location, this.start, this.end, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>OrderDetails(
           start: start,
          from: from,
          end: end,
          location: location,
          id: id,
        )));
      },
      child: Container(
        height: height*.36,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height:height*.1,
                    width: height*.12,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(80),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Order #${id}",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "dinnextl bold",
                              fontSize:16,)),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height:3,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:10,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocaleKeys.status.tr(),style: TextStyle(
                        fontFamily: "dinnextl bold",
                        fontSize:16,)),
                      Text(from,style: TextStyle(
                        fontFamily: "dinnextl medium",
                        color: kTextColor,
                        fontSize:16,)),
                      Text(LocaleKeys.location.tr(),style: TextStyle(
                        fontFamily: "dinnextl bold",
                        fontSize:16,)),
                      Text(location,style: TextStyle(
                        fontFamily: "dinnextl medium",
                        color: kTextColor,
                        fontSize:16,)),
                      Text(LocaleKeys.startTime.tr(),style: TextStyle(
                        fontFamily: "dinnextl bold",
                        fontSize:16,)),
                      Text(start,style: TextStyle(
                        fontFamily: "dinnextl medium",
                        color: kTextColor,
                        fontSize:16,)),
                      Text(LocaleKeys.endTime.tr(),style: TextStyle(
                        fontFamily: "dinnextl bold",
                        fontSize:16,)),
                      Text(end,style: TextStyle(
                        fontFamily: "dinnextl medium",
                        color: kTextColor,
                        fontSize:16,)),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height:height*.12,
                      child: Image.asset("assets/images/login.png"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
