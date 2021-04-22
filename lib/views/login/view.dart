import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/login/bloc/cubit.dart';
import 'package:aile/views/login/loginForm.dart';
import 'package:aile/views/signUp/view.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:aile/widgets/donotHave.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (_)=>LoginCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Container(
          height: height*1,
          color: kPrimaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height*.8,
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      )
                  ),
                  child:LoginForm(),
                ),
                SizedBox(height: height*.12,),
                DoNotHave(text: LocaleKeys.signUp.tr(),
                  have: LocaleKeys.donHave.tr(),
                  route: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpView()));
                  },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
