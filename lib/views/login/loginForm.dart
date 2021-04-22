import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/login/bloc/cubit.dart';
import 'package:aile/views/login/submit.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../constants.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final cubit= LoginCubit.get(context);
    return Form(
       key:  cubit.loginKey,
      child: ListView(
        children: [
          SizedBox(
            height: height*.35,
              child: Image.asset("assets/images/login.png")),
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return LocaleKeys.eEmail.tr();
              }
              return null;
            },
            onsave: (v){
              cubit.email=v;
            },
            hint: LocaleKeys.email.tr(),
            dIcon: Icons.email,
            label: true,
            labelText:LocaleKeys.email.tr() ,
          ),
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return LocaleKeys.ePassword.tr();
              }
            },
            onsave: (v){
              cubit.password=v;
            },
            label: true,
            labelText:LocaleKeys.password.tr() ,
            hint: LocaleKeys.password.tr(),
            dIcon: Icons.lock,
            icon: Icons.lock_outline,
          ),
          GestureDetector(
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgetPassword()));
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:40),
              child: Row(
                children: [
                  Text(LocaleKeys.forgotPassword.tr(), style: TextStyle(
                    fontFamily: "dinnextl bold",
                    color:kPrimaryColor,
                    fontSize:16,),),
                ],
              ),
            ),
          ),
          SizedBox(height: height*.05,),
          LoginSubmit(),

        ],
      ),
    );
  }
}
