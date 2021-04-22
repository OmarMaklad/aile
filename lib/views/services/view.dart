import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/services/bloc/cubit.dart';
import 'package:aile/views/services/pages/All.dart';
import 'package:aile/views/services/pages/recomnd.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';


class Services extends StatefulWidget {
  final String title;

   Services({ this.title});
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController =TabController(length:2,vsync: this,initialIndex:0);
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
                  widget.title,
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
                            Text(LocaleKeys.all.tr(),
                              style: TextStyle(
                                fontFamily: "dinnextl bold",
                                color: Colors.black,
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
                            Text(LocaleKeys.recomended.tr(),
                              style: TextStyle(
                                fontFamily: "dinnextl bold",
                                color: Colors.black,
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
                          All(),
                          Recomended(),
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
