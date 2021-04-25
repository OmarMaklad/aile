import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/memberDetails/bloc/cubit.dart';
import 'package:aile/views/memberDetails/bloc/state.dart';
import 'package:aile/views/tabsScreen/view.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:aile/widgets/smallButton.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';
import 'chooseType.dart';

class SpatialOrderDialog extends StatefulWidget {
  @override
  _SpatialOrderDialogState createState() => _SpatialOrderDialogState();
}

class _SpatialOrderDialogState extends State<SpatialOrderDialog> {
  GlobalKey<FormState> _globalKey =GlobalKey<FormState>();
  Color color ;
  Color color1;
  Color color2;
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final cubit = OrderCubit.get(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(LocaleKeys.order.tr(),style: TextStyle(
            fontFamily: "dinnextl bold",
            fontSize:22,),)
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Padding(
              padding:EdgeInsets.only(top: height*.05,bottom:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChooseType(onPressed: (){
                    setState(() {
                      color=kPrimaryColor;
                      color1=null;
                      color2=null;
                      cubit.type=context.locale == Locale('en', 'US')?"Daily":"يومى";
                    });
                  }, title:context.locale == Locale('en', 'US')?"Daily":"يومى",color: color,),
                  ChooseType(onPressed: (){
                    setState(() {
                      color1=kPrimaryColor;
                      color=null;
                      color2=null;
                      cubit.type=context.locale == Locale('en', 'US')? "Weekly":"اسبوعى";
                    });
                  }, title:context.locale == Locale('en', 'US')? "Weekly":"اسبوعى",color: color1,),
                  ChooseType(onPressed: (){
                    setState(() {
                      color2=kPrimaryColor;
                      color1=null;
                      color=null;
                      cubit.type=context.locale == Locale('en', 'US')?"Monthly":"شهرى";
                    });
                  }, title: context.locale == Locale('en', 'US')?"Monthly":"شهرى",color: color2,),
                ],
              ),
            ),
            SizedBox(height: height*.03,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15,vertical:10),
              child: Text(context.locale == Locale('en', 'US')?"Set Date":"اكتب التاريخ",style: TextStyle(color:Colors.black,fontSize: 17, fontFamily: "dinnextl bold",),),
            ),
            Container(
              height: height*.07,
              width:double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'yyyy-MM-dd',
                cursorColor: kPrimaryColor,
                firstDate: DateTime.utc(2020),
                lastDate: DateTime.utc(2200),
                decoration:InputDecoration(
                  hintText:context.locale == Locale('en', 'US')?"Date":"التاريخ",
                  prefixIcon: Icon(Icons.date_range),
                  hintStyle: TextStyle(fontSize: 14,color: kTextColor,fontFamily: "dinnextl medium"),
                  filled: true,
                  focusColor: Colors.white,
                  fillColor:Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:kPrimaryColor,width:1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor,width:1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                use24HourFormat: false,
                onChanged: (val) {
                  cubit.date = val.toString();
                },
                validator: (val) {
                  if(val.isEmpty){
                    return "يرجى ادخال التاريخ";
                  }else{
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: height*.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                      child: Text(LocaleKeys.startTime.tr(), style: TextStyle(color:Colors.black,fontSize: 17, fontFamily: "dinnextl bold",),),
                    ),
                    Container(
                      height: height*.07,
                      width: height*.22,
                      child: Center(
                        child: DateTimePicker(
                          type: DateTimePickerType.time,
                          dateMask: 'yyyy-MM-dd',
                          cursorColor: kPrimaryColor,
                          firstDate: DateTime.utc(2020),
                          lastDate: DateTime.utc(2200),

                          decoration:InputDecoration(
                            hintText:LocaleKeys.startTime.tr() ,
                            prefixIcon: Icon(Icons.alarm),
                            hintStyle: TextStyle(fontSize: 14,color: kTextColor,fontFamily: "dinnextl medium"),
                            filled: true,
                            focusColor: Colors.white,
                            fillColor:Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:kTextColor,width:1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor,width:1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          use24HourFormat: false,
                          onChanged: (val) {
                            cubit.sTime = val.toString();
                          },
                          validator: (val) {
                            if(val.isEmpty){
                              return "يرجى ادخال الوقت";
                            }else{
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 15,vertical:8),
                      child: Text(LocaleKeys.endTime.tr(), style: TextStyle(color:Colors.black,fontSize: 17, fontFamily: "dinnextl bold",),),
                    ),
                    Container(
                      height: height*.07,
                      width: height*.22,
                      child: DateTimePicker(
                        type: DateTimePickerType.time,
                        dateMask: 'yyyy-MM-dd',
                        cursorColor: kPrimaryColor,
                        firstDate: DateTime.utc(2020),
                        lastDate: DateTime.utc(2200),
                        textAlign: TextAlign.right,
                        decoration:InputDecoration(
                          hintText:LocaleKeys.endTime.tr() ,
                          prefixIcon: Icon(Icons.alarm),
                          hintStyle: TextStyle(fontSize: 14,color: kTextColor,fontFamily: "dinnextl medium"),
                          filled: true,
                          focusColor: Colors.white,
                          fillColor:Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:kTextColor,width:1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor,width:1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        use24HourFormat: false,
                        onChanged: (val) {
                          cubit.eTime = val.toString();
                          setState(() {

                          });
                        },
                        validator: (val) {
                          if(val.isEmpty){
                            return "يرجى ادخال الوقت";
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height*.04,),
            CustomTextField(
              dIcon: Icons.countertops,
              hint:context.locale == Locale('en', 'US')?"Number of Day":"عدد الايام" ,
              valid: (v){
                if(v.isEmpty){
                  return context.locale == Locale('en', 'US')?"Required":"حقل فارغ";
                }
              },
              controller: cubit.controller,
              onsave: (v){
                cubit.counter=v;
              },

            ),
            SizedBox(height: height*.01,),
            CustomTextField(
              dIcon: Icons.location_on,
              hint: LocaleKeys.address.tr(),
              valid: (v){
                if(v.isEmpty){
                  return LocaleKeys.address.tr();
                }
              },
              controller: cubit.controller1,
              onsave: (v){
                cubit.address=v;
              },

            ),
            SizedBox(height: height*.05,),
            BlocConsumer<OrderCubit,OrderState>(
                listener: (_,state){
                  if(state is SOrderErrorState )
                    Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      ),)));
                  if(state is SOrderSuccessState ){
                    cubit.controller.clear();
                    cubit.controller1.clear();
                    cubit.date =null;
                    cubit.sTime =null;
                    cubit.eTime =null;
                    cubit.type=null;
                    cubit.counter=null;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>TabsScreen()));
                  }
                },
                builder:(_,state)=>state is SOrderLoadingState ? Center(
                  child: SpinKitChasingDots(
                    size: 40,
                    color: kPrimaryColor,
                  ),
                ) :CustomButton(
                    onPressed: (){
                      if(_globalKey.currentState.validate()){
                        cubit.sendSpatialOrder(
                          lang: context.locale == Locale('en', 'US')?"en":"ar",
                        );
                      }
                    }, title: LocaleKeys.order.tr()))
          ],
        ),
      ),
    );
  }
}
