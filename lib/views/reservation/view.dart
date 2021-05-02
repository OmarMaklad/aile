import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/reservation/controller/controller.dart';
import 'package:aile/views/reservation/model/model.dart';
import 'package:aile/views/reservation/pages/current.dart';
import 'package:aile/views/reservation/pages/previous.dart';
import 'package:aile/views/services/bloc/cubit.dart';
import 'package:aile/views/services/pages/All.dart';
import 'package:aile/views/services/pages/recomnd.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants.dart';


class Reservation extends StatefulWidget {
  final String lang;

  Reservation({ this.lang});
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ReservationController _reservationController =ReservationController();
  PreviousModel _previousModel =PreviousModel();
  bool loading =true;
  void _getRes()async{
    _previousModel = await _reservationController.getReservation(
      lang: widget.lang,
    );
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    _tabController =TabController(length:2,vsync: this,initialIndex:0);
    _getRes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor:kPrimaryColor,
          title: Text(
            EasyLocalization.of(context).locale == Locale('en', 'US')?
            "Reservations":
            "الطلبات",
            style: TextStyle(
              fontFamily: "dinnextl bold",
              fontSize:22,),),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: kPrimaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              indicatorPadding:EdgeInsets.symmetric(horizontal:20),
              controller: _tabController,
              isScrollable: true,
              tabs: [
                FlatButton(
                  child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical:25),
                    child: Column(
                      children: [
                        Text(
                          EasyLocalization.of(context).locale == Locale('en', 'US')?
                          "Previous Reservation":
                          "الطلبات السابقة",
                          style: TextStyle(
                            fontFamily: "dinnextl bold",
                            color: Colors.deepPurple,
                            fontSize:16,),),
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical:25),
                    child: Column(
                      children: [
                        Text(
                          EasyLocalization.of(context).locale == Locale('en', 'US')?
                          "current Reservation":
                          "الطلبات الحالية",
                          style: TextStyle(
                            fontFamily: "dinnextl bold",
                            color: Colors.deepPurple,
                            fontSize:16,),),
                      ],
                    ),
                  ),
                ),


              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.only(top: height*.02),
                  height:height*1,
                  color: kBackgroundColor,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      loading?Center(
                  child: SpinKitChasingDots(
                    size: 40,
                    color: kPrimaryColor,
                  )):Previous(previousModel: _previousModel,),
                      loading?Center(
                          child: SpinKitChasingDots(
                            size: 40,
                            color: kPrimaryColor,
                          )):Currents(previousModel: _previousModel,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
