import 'package:aile/views/notifications/view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../constants.dart';

class NotificationCard extends StatefulWidget {
  final String text;
  final int id;

  NotificationCard({this.text, this.id,});

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 35,
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.delete,color:Colors.yellow,size: 25,),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                widget.text,
                textAlign: TextAlign.justify,
                style: TextStyle( fontFamily: "dinnextl medium", fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
