import 'dart:ffi';

import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/condition/view.dart';
import 'package:aile/views/contactUs/view.dart';
import 'package:aile/views/drawer/view.dart';
import 'package:aile/views/favoruits/bloc/cubit.dart';
import 'package:aile/views/favoruits/view.dart';
import 'package:aile/views/home/bloc/cubit.dart';
import 'package:aile/views/home/view.dart';
import 'package:aile/views/langs/view.dart';
import 'package:aile/views/notifications/view.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/views/profile/bloc/profileState.dart';
import 'package:aile/views/profile/view.dart';
import 'package:aile/views/reservation/view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants.dart';
import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';

class TabsScreen extends StatefulWidget {
  final int screenIndex;
  TabsScreen({ this.screenIndex,});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int userScreenIndex = 1;
  List<Widget> userScreens= [
    HomeView(),
    HomeView(),
    FavouritesView(),
    Notifications(),
  ];

  @override
  void initState() {
    if(widget.screenIndex!=null){
      setState(() {
        userScreenIndex= widget.screenIndex;
      });
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_)=>HomeCubit()..getBanner(lang: context.locale == Locale('en', 'US')?"en":"ar") ),
        BlocProvider(create:(_)=>FavCubit()..getFav(lang: context.locale == Locale('en', 'US')?"en":"ar") ),
        BlocProvider(create:(_)=>ProfileCubit()..getProfile(lang: context.locale == Locale('en', 'US')?"en":"ar") ),
      ],

      child: WillPopScope(
        onWillPop: ()async{
          return exit(0);
        },
        child: Scaffold(
          key: _drawerKey,
          drawer: Container(
            width: MediaQuery.of(context).size.height*.3,
            child: Drawer(
              elevation: 20,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/dr.png"),
                      fit: BoxFit.cover
                  ),
                ),
                child: BlocConsumer<ProfileCubit,ProfileState>(
                  listener: (_,state)=>null,
                    builder:(_,state)=> state is ProfileSuccessState?
                   Padding(
                      padding:  EdgeInsets.symmetric(vertical:70,horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(150),
                                      image: DecorationImage(
                                          image:NetworkImage(cubit.profileModel.data.image),
                                          fit: BoxFit.fill),
                                    ),
                                    height:75,
                                    width: 75,

                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  cubit.profileModel.data.name,
                                  style: TextStyle(color:Colors.black,fontSize: 18, fontFamily: "dinnextl bold",),),
                              ),
                          SizedBox(height:40,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileView()));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.person,color: kTextColor,size:25,),
                                    SizedBox(width:5,),
                                    Text(
                                      LocaleKeys.profile.tr(),
                                      style: TextStyle(color:Colors.black,fontSize: 16, fontFamily: "dinnextl medium",),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 18,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>Reservation(
                                      lang: context.locale == Locale('en', 'US')?"en":"ar",
                                  )));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.edit,color: kTextColor,size:25,),
                                    SizedBox(width:5,),
                                    Text(
                                      context.locale == Locale('en', 'US')?
                                      "Reservations":
                                      "الطلبات",
                                      style: TextStyle(color:Colors.black,fontSize: 16, fontFamily: "dinnextl medium",),),
                                  ],
                                ),
                              ),
                          SizedBox(height: 18,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ConditionView(
                                lang: context.locale == Locale('en', 'US')?"en":"ar",
                              )));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.help,color: kTextColor,size:25,),
                                SizedBox(width:5,),
                                Text(
                                  LocaleKeys.conditions.tr(),
                                  style: TextStyle(color:Colors.black,fontSize: 16, fontFamily: "dinnextl medium",),),
                              ],
                            ),
                          ),
                          SizedBox(height: 18,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ContactUs()));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.assignment_ind,color: kTextColor,size:25,),
                                SizedBox(width:5,),
                                Text(
                                  LocaleKeys.contactUs.tr(),
                                  style: TextStyle(color:Colors.black,fontSize: 16, fontFamily: "dinnextl medium",),),
                              ],
                            ),
                          ),
                          SizedBox(height: 18,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ChangeLang()));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.language,color: kTextColor,size:25,),
                                SizedBox(width:5,),
                                Text(
                                  LocaleKeys.language.tr(),
                                  style: TextStyle(color:Colors.black,fontSize: 16, fontFamily: "dinnextl medium",),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                        :Text(""),
                ),
              ),
            ),
          ),
          backgroundColor: kBackgroundColor,
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
              userScreens[userScreenIndex]
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            color: Colors.white,
            backgroundColor:kBackgroundColor,
            buttonBackgroundColor: Colors.white,
            height:65,
            index: userScreenIndex,
            animationDuration: Duration(
                milliseconds:200
            ),
            animationCurve: Curves.bounceInOut,
            items: <Widget>[
              Icon(Icons.settings, size:30,color:kPrimaryColor),
              Icon(Icons.home, size: 30,color: kPrimaryColor,),
              Icon(Icons.favorite, size:30,color: kPrimaryColor,),
              Icon(Icons.notifications, size:30,color: kPrimaryColor,),

            ],
            onTap: (index) {
              setState(() {
                if(index==0){
                  _drawerKey.currentState.openDrawer();
                }else if(index==2){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>TabsScreen(screenIndex: 2,)));
                }else{
                  userScreenIndex = index;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}