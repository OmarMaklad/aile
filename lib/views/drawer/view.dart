import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/condition/view.dart';
import 'package:aile/views/contactUs/view.dart';
import 'package:aile/views/langs/view.dart';
import 'package:aile/views/login/view.dart';
import 'package:aile/views/memberProfile/view.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/views/profile/bloc/profileState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
    return  Container(
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
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>MemberProfile()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person,color: kTextColor,size:30,),
                        SizedBox(width:5,),
                        Text(
                          LocaleKeys.profile.tr(),
                          style: TextStyle(color:Colors.black,fontSize: 18, fontFamily: "dinnextl medium",),),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
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
                          style: TextStyle(color:Colors.black,fontSize: 18, fontFamily: "dinnextl medium",),),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
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
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: ()async{
                      SharedPreferences _prefs = await SharedPreferences.getInstance();
                      _prefs.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Login()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.cancel,color: kTextColor,size:25,),
                        SizedBox(width:5,),
                        Text(
                          LocaleKeys.logOut.tr(),
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
    );
  }
}
