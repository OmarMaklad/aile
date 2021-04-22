import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/memberDetails/bloc/cubit.dart';
import 'package:aile/views/memberDetails/bloc/state.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';

class OrderDialog extends StatefulWidget {
  @override
  _OrderDialogState createState() => _OrderDialogState();
}

class _OrderDialogState extends State<OrderDialog> {
  GlobalKey<FormState> _globalKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final cubit = OrderCubit.get(context);
    return Container(
      height: height*.5,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Text("Set Date",style: TextStyle(color:Colors.black,fontSize: 17, fontFamily: "dinnextl bold",),),
            ),
            Container(
              height: height*.07,
              width: height*.23,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'yyyy-MM-dd',
                cursorColor: kPrimaryColor,
                firstDate: DateTime.utc(2020),
                lastDate: DateTime.utc(2200),
                textAlign: TextAlign.right,
                decoration:InputDecoration(
                  hintText:LocaleKeys.dateOf.tr() ,
                  suffixIcon: Icon(Icons.date_range),
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
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                       child: Text("Start", style: TextStyle(color:Colors.black,fontSize: 17, fontFamily: "dinnextl bold",),),
                     ),
                     Container(
                       height: height*.07,
                       width: height*.15,
                       child: Center(
                         child: DateTimePicker(
                           type: DateTimePickerType.time,
                           dateMask: 'yyyy-MM-dd',
                           cursorColor: kPrimaryColor,
                           firstDate: DateTime.utc(2020),
                           lastDate: DateTime.utc(2200),
                           textAlign: TextAlign.right,
                           decoration:InputDecoration(
                             hintText:"start" ,
                             suffixIcon: Icon(Icons.alarm),
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
                       child: Text("End", style: TextStyle(color:Colors.black,fontSize: 17, fontFamily: "dinnextl bold",),),
                     ),
                     Container(
                       height: height*.07,
                       width: height*.15,
                       child: DateTimePicker(
                         type: DateTimePickerType.time,
                         dateMask: 'yyyy-MM-dd',
                         cursorColor: kPrimaryColor,
                         firstDate: DateTime.utc(2020),
                         lastDate: DateTime.utc(2200),
                         textAlign: TextAlign.right,
                         decoration:InputDecoration(
                           hintText:"start" ,
                           suffixIcon: Icon(Icons.alarm),
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
            CustomTextField(
              dIcon: Icons.location_on,
              hint: "address",
              valid: (v){
                if(v.isEmpty){
                  return " ";
                }
              },
              controller: cubit.controller,
              onsave: (v){
                cubit.address=v;
              },

            ),
            BlocConsumer<OrderCubit,OrderState>(
                listener: (_,state){
                  if(state is OrderErrorState ){
                  print("hhhh");
                  }
                  if(state is OrderSuccessState ){
                    cubit.controller.clear();
                    cubit.date =null;
                    cubit.sTime =null;
                    cubit.eTime =null;
                    Navigator.pop(_);
                  }
                },
                builder:(_,state)=>state is OrderLoadingState ? Center(
                    child: SpinKitChasingDots(
                  size: 40,
                  color: kPrimaryColor,
                    ),
                  ) :CustomButton(
                    onPressed: (){

                      if(_globalKey.currentState.validate()){
                        cubit.sendOrder(
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
