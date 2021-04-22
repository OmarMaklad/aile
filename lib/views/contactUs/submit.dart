import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/contactUs/state/state.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../constants.dart';
import 'cubit/cubit.dart';



class ContactUSSubmit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = ContactUsCubit.get(context);
    return BlocConsumer<ContactUsCubit,ConUsState>(
      listener: (_,state){
        if(state is ConUsErrorState )
          Scaffold.of(_).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14
            ),)));
        if(state is ConUsSuccessState ){
          showDialog(
              context: context,
              builder:(_)=>AlertDialog(
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                content: Container(
                  height:MediaQuery.of(context).size.height*.1,
                  width: double.infinity,
                  child:Column(
                    children: [
                      Icon(Icons.check_circle_outline,color: kPrimaryColor,size:40,),
                      Text(LocaleKeys.done.tr(),style: TextStyle(
                      fontFamily: "dinnextl bold",
                      fontSize: 16
                      ),),
                    ],
                  ) ,),
              )
          );
         cubit.controller.clear();
         cubit.controller1.clear();
         cubit.controller2.clear();
         cubit.controller3.clear();
         cubit.controller4.clear();
        }
      },
        builder: (_,state){
        return state  is ConUsLoadingState?
        Center(
          child: SpinKitChasingDots(
            size: 40,
            color: kPrimaryColor,
          ),
        ) : CustomButton(
            onPressed: (){
              if(cubit.conUsKey.currentState.validate()){
                cubit.sendContact();
              }
            },
            title:LocaleKeys.send.tr() );
        },);
  }
}
