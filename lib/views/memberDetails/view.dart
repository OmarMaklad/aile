import 'package:aile/constants.dart';
import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/favoruits/bloc/cubit.dart';
import 'package:aile/views/memberDetails/bloc/cubit.dart';
import 'package:aile/views/memberDetails/data/controller.dart';
import 'package:aile/views/memberDetails/dialog.dart';
import 'package:aile/views/memberDetails/model/model.dart';
import 'package:aile/views/memberDetails/spatialDialog.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/views/signUp/view.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:aile/widgets/smallButton.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MemberDetails extends StatefulWidget {
  final int id;
  final String lang;

  const MemberDetails({Key key, this.id, this.lang}) : super(key: key);
  @override
  _MemberDetailsState createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> {
  MDetailsController _mDetailsController =MDetailsController();
  MDetailsModel _mDetailsModel =MDetailsModel();
  bool loading= true;
  bool like = false;
  void _getMember()async{
    _mDetailsModel =await _mDetailsController.getMember(
        id:widget.id,
        lang:widget.lang);
    setState(() {
      loading=false;
    });
  }
  GetStorage box =GetStorage();
  @override
  void initState() {
   _getMember();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body:loading?
      Center(
        child:  SpinKitChasingDots(
          size: 40,
          color: kPrimaryColor,
        ),
      ):ListView(
        children: [
          Stack(
            children: [
              Container(
                height: height*.4,
                padding: EdgeInsets.only(top: height*.1),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white,
                        kPrimaryColor,
                      ],
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 38,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        maxRadius: 36,
                        backgroundImage: NetworkImage(_mDetailsModel.data.image),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(_mDetailsModel.data.name, style: TextStyle( fontFamily: "dinnextl bold", fontSize: 16),),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,size: 20,color: Colors.yellow,),
                        Text(_mDetailsModel.data.rate.toString(), style: TextStyle( fontFamily: "dinnextl medium", fontSize: 14),),
                        Container(margin: EdgeInsets.symmetric(horizontal: 5),width: 1,height: 20,color:kTextColor,),
                        Text("${_mDetailsModel.data.salary}\$ h", style: TextStyle( fontFamily: "dinnextl medium", fontSize: 14),)
                      ],
                    ),
                  ],
                ),
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
              Container(
                margin: EdgeInsets.only(top: height*.33),
                height: height*.67,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                ),
                child: ListView(
                  children: [
                    SizedBox(height: height*.06,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(LocaleKeys.location.tr(), style: TextStyle( fontFamily: "dinnextl bold", fontSize: 18)),
                          GestureDetector(
                            onTap: ()async{
                              setState(() {
                                like=!like;
                              });
                              await _mDetailsController.fav(
                                id: widget.id,
                                lang: widget.lang
                              );
                            },
                              child: Icon(_mDetailsModel.data.fav==false?Icons.favorite_border
                                :Icons.favorite,size:30,color: Colors.red,)),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                      child: Row(

                        children: [
                          Icon(Icons.location_on,color: kPrimaryColor,),
                          Text(_mDetailsModel.data.address,  style: TextStyle( fontFamily: "dinnextl medium", fontSize: 14,color: kTextColor)),

                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                          child: Text("Details",style: TextStyle( fontFamily: "dinnextl bold", fontSize: 18))),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:30),
                      child: Text(_mDetailsModel.data.description*100,style: TextStyle( fontFamily: "dinnextl medium", fontSize: 14,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(title:LocaleKeys.order.tr(),
                            onPressed: ()async{
                            SharedPreferences _prefs = await SharedPreferences.getInstance();
                            if(_prefs.getString("token")==null){
                              showDialog(context: context,builder: (_)=>
                                  AlertDialog(
                                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                    content: Container(
                                      height:MediaQuery.of(context).size.height*.3,
                                      width: double.infinity,
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.warning_amber_outlined,color: Colors.red,size: 40,),
                                          Text(LocaleKeys.shouldSignUp.tr(),
                                            style: TextStyle(fontSize: 18,
                                              fontFamily: "dinnextl medium",),),
                                          SizedBox(height: 10,),
                                          SmallButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpView()));
                                          }, title: LocaleKeys.signUp.tr(),color: kPrimaryColor,),
                                          SmallButton(onPressed: (){
                                            Navigator.pop(context);
                                          }, title: LocaleKeys.no.tr()),
                                        ],
                                      ),
                                    ),
                                  ),
                              );
                            }else{
                              OrderCubit.get(context).id=widget.id;
                              showDialog(context: context,builder:(_)=>AlertDialog(
                                backgroundColor: Colors.transparent,
                                content:OrderDialog(),
                              ));
                            }

                          }),
                          SizedBox(height: 10,),
                          box.read("package")==null?SizedBox():
                         CustomButton(title: context.locale == Locale('en', 'US')?
                          "Spatial Order":
                          "طلب خاص",
                            onPressed: ()async {
                              SharedPreferences _prefs = await SharedPreferences
                                  .getInstance();
                              if (_prefs.getString("token") == null) {
                                showDialog(context: context, builder: (_) =>
                                    AlertDialog(
                                      shape: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15)),
                                      content: Container(
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height * .3,
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            Icon(Icons.warning_amber_outlined,
                                              color: Colors.red, size: 40,),
                                            Text(LocaleKeys.shouldSignUp.tr(),
                                              style: TextStyle(fontSize: 18,
                                                fontFamily: "dinnextl medium",),),
                                            SizedBox(height: 10,),
                                            SmallButton(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpView()));
                                            }, title: LocaleKeys.signUp.tr(),color: kPrimaryColor,),
                                            SmallButton(onPressed: (){
                                              Navigator.pop(context);
                                            }, title: LocaleKeys.no.tr()),
                                          ],
                                        ),
                                      ),
                                    ),
                                );
                              } else {
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>SpatialOrderDialog()));
                              }
                            },color: Colors.white,),
                        ],
                      ),
                    ),
                    SizedBox(height: height*.06,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}