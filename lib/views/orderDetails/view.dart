import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/memberHome/orderCard.dart';
import 'package:aile/views/orderDetails/controller/controller.dart';
import 'package:aile/views/orderDetails/model.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'package:easy_localization/easy_localization.dart';

import 'cardDetails.dart';

class OrderDetails extends StatefulWidget {
  final String  from;
  final String  location;
  final String  start;
  final int  id;
  final String  end;

  const OrderDetails({Key key, this.from, this.location, this.start, this.id, this.end}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(LocaleKeys.order.tr(), style: TextStyle(
            fontFamily: "dinnextl bold",
            fontSize: 22,),)
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/bk.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child:DetailsCard(
                id: widget.id,
                location: widget.location,
                end: widget.end,
                from: widget.from,
                start: widget.start,
              ),
          ),

        ],
      ),
    );
  }
}
