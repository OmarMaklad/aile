import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/home/bloc/cubit.dart';
import 'package:aile/views/home/bloc/state.dart';
import 'package:aile/views/home/slider.dart';
import 'package:aile/views/home/smallSlider.dart';
import 'package:aile/views/home/suitsList.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';
import 'dart:ui';
import '../../constants.dart';

class HomeView extends StatelessWidget {
  final bool log;

  const HomeView({Key key, this.log}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: ()async{
        return exit(0);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
          body: BlocConsumer<HomeCubit,BannerState>(
            listener: (_,state)=>null,
            builder:(_,state)=>state is BannerSuccessState?CustomScrollView(
              slivers: [
                SliverList(
                  delegate:SliverChildListDelegate(
                      [
                        OfferSlider(),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:10,horizontal: 20),
                          child: Text( context.locale == Locale('en', 'US')?
                          "Packages":
                          "الباقات",
                            style: TextStyle(
                              fontFamily: "dinnextl bold",
                              fontSize:24,),),
                        ),
                        SmallSlider(),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:10,horizontal: 20),
                          child: Text(LocaleKeys.choose.tr(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "dinnextl bold",
                              fontSize:20,),),
                        ),

                      ]
                  ),
                ),
                SuitsList()
              ],
            ):Center(
              child:  SpinKitChasingDots(
                size: 40,
                color: kPrimaryColor,
              ),
            ),
          )
      ),
    );
  }
}
