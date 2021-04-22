import 'dart:io';

import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/drawer/view.dart';
import 'package:aile/views/memberHome/controller/controller.dart';
import 'package:aile/views/memberHome/model/model.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/views/profile/bloc/profileState.dart';
import 'package:aile/views/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';
import 'orderCard.dart';

class MemberHome extends StatefulWidget {
  final String lang;

  const MemberHome({Key key, this.lang}) : super(key: key);
  @override
  _MemberHomeState createState() => _MemberHomeState();
}

class _MemberHomeState extends State<MemberHome> {
   MOrdersModel _ordersModel =MOrdersModel();
   MOrdersController _mOrdersController =MOrdersController();
   bool loading=true;
   void _getOrder()async{
     _ordersModel = await _mOrdersController.getMOrder(
       lang: widget.lang
     );
     setState(() {
       loading = false;
     });
   }
   @override
  void initState() {
    _getOrder();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: ()async{
        return exit(0);
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            centerTitle: true,
            title: Text(LocaleKeys.myOrders.tr(),style: TextStyle(
              fontFamily: "dinnextl bold",
              fontSize:22,),)
        ),
        drawer:DrawerView(),
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
        loading?SpinKitChasingDots(
          color: kPrimaryColor,
           size:40,
        ):Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: ListView.separated(
              itemBuilder:(cxt,index)=>OrderCard(
                id: _ordersModel.data[index].id,
                location: _ordersModel.data[index].address.toString(),
                from: _ordersModel.data[index].type,
                start: _ordersModel.data[index].startTime,
                end: _ordersModel.data[index].endTime,

              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (ctx,ind)=>SizedBox(height:15),
              itemCount:_ordersModel.data.length),
        ),

          ],
        ),
      ),
    );
  }
}
