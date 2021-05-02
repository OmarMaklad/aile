import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/views/tabsScreen/view.dart';
import 'package:aile/views/varificationCode/view.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants.dart';
import 'bloc/cubit.dart';
import 'bloc/state.dart';
class SignUpSubmit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final cubit = SignUpCubit.get(context);
    return Column(
      children: [
        SizedBox(height:height*.06,),
        BlocConsumer<SignUpCubit,SignUpState>(
          listener: (_,state){
            if(state is SignUpErrorState )
              Scaffold.of(_).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                ),)));
            if(state is SignUpSuccessState ){
              BlocProvider.of<ProfileCubit>(context).getProfile(lang: context.locale == Locale('en', 'US')?"en":"ar");
              Navigator.push(context, MaterialPageRoute(builder: (_)=>TabsScreen()));
            }
          },
          builder: (context,state){
            return state is SignUpLoadingState ? Center(
              child: SpinKitChasingDots(
                size: 40,
                color: kPrimaryColor,
              ),
            ) :  CustomButton(
                onPressed: (){
                  if(cubit.signUpKey.currentState.validate()){
                    cubit.signUp(lang: context.locale == Locale('en', 'US')?"en":"ar");
                  }
                },
                title: "SignUp");

          },
        ),

      ],
    );
  }
}
