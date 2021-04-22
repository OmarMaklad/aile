import 'dart:ui';
import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/packageDetails/bloc/cubit.dart';
import 'package:aile/views/packageDetails/bloc/state.dart';
import 'package:aile/views/packageDetails/model/model.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';
import 'package:easy_localization/easy_localization.dart';



class PackageDetails extends StatefulWidget {
  final int id;
  final String lang;

  const PackageDetails({Key key, this.id, this.lang}) : super(key: key);
  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final cubit = PackageCubit.get(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<PackageCubit,PackageState>(
        listener: (_,state)=>null,
        builder:(_,state)=> state is PackageSuccessState?Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height*.4,
                  width: double.infinity,

                  child: Image.network(cubit.packageModel.data.image, fit: BoxFit.cover,),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20,vertical:40),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:height*.25),
                  child: Container(
                    height: height*.75,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Padding(
                                padding: EdgeInsets.only(top: height*.07),
                                child: Text(cubit.packageModel.data.name,
                                  style: TextStyle(fontSize:24,fontFamily: "dinnextl bold",),),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal:30),
                              child: Padding(
                                padding: EdgeInsets.only(top: height*.07),
                                child: Text(" ${cubit.packageModel.data.months} ${LocaleKeys.month.tr()}",style: TextStyle(fontSize:20,
                                  fontFamily: "dinnextl bold",),),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          child: Text(cubit.packageModel.data.description*140,
                            style: TextStyle(fontSize: 14,color: kTextColor,fontFamily: "dinnextl medium",),),
                        ),
                        SizedBox(height:25,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(LocaleKeys.price.tr(),style: TextStyle(fontSize:20,
                            fontFamily: "dinnextl bold",),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("${cubit.packageModel.data.cost} SAR",
                            style: TextStyle(fontSize: 18,
                              fontFamily: "dinnextl medium",),),
                        ),
                        SizedBox(height:height*.08,),

                        CustomButton(onPressed: (){
                          showDialog(context: context,builder: (_)=>
                              AlertDialog(
                                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                content: Container(
                                  height:MediaQuery.of(context).size.height*.12,
                                  width: double.infinity,
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.check_circle_outline,color: Colors.green,size: 40,),
                                      Text(LocaleKeys.paySuccess.tr(),
                                        style: TextStyle(fontSize: 18,
                                          fontFamily: "dinnextl medium",),),
                                    ],
                                  ),
                                ),
                              ),
                          );
                        }, title: LocaleKeys.confirm.tr()),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ):Center(
          child:  SpinKitChasingDots(
            size: 40,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
