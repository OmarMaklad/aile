import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/login/bloc/cubit.dart';
import 'package:aile/views/memberHome/view.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/views/profile/bloc/profileState.dart';
import 'package:aile/views/tabsScreen/view.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import 'bloc/state.dart';

class LoginSubmit extends StatefulWidget {
  @override
  _LoginSubmitState createState() => _LoginSubmitState();
}

class _LoginSubmitState extends State<LoginSubmit> {
  Widget route;
   void _checktype()async{
     SharedPreferences _prefs = await SharedPreferences.getInstance();
    route = _prefs.getString("type")=="user"?TabsScreen():MemberHome(
      lang: EasyLocalization.of(context).locale == Locale('en', 'US')?"en":"ar"
    );
   }
  @override
  Widget build(BuildContext context) {
    final cubit= LoginCubit.get(context);
    return BlocConsumer<LoginCubit,LoginState>(
        listener: (_,state){
          if(state is LoginErrorState )
            Scaffold.of(_).showSnackBar(SnackBar(backgroundColor: Colors.white,content: Text(state.error,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14
              ),)));
          if(state is LoginSuccessState ){
            _checktype();
            BlocProvider.of<ProfileCubit>(context).getProfile(lang: EasyLocalization.of(context).locale == Locale('en', 'US')?"en":"ar");
            Navigator.push(context, MaterialPageRoute(builder: (_)=>route));
          }
        },
        builder: (context,state){
          return state is LoginLoadingState ? Center(
            child: SpinKitChasingDots(
              size: 40,
              color: kPrimaryColor,
            ),
          ) :  CustomButton(
              onPressed: (){
                if(cubit.loginKey.currentState.validate()){
                  cubit.signIn();
                }
              },
              title: "SignIn");

        },
    );
  }
}
