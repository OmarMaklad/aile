import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/signUp/bloc/cubit.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class CompleteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.get(context);
    return Form(
      key: cubit.signUpKey,
      child: Column(
        children: [
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return LocaleKeys.userName.tr().toString();
              }
            },
            onsave: (v){
              cubit.name=v;
            },
            hint: LocaleKeys.userName.tr(),
            label: true,
            labelText:LocaleKeys.userName.tr() ,
            dIcon: Icons.person,
          ),
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return LocaleKeys.eEmail.tr().toString();
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
                return LocaleKeys.phoneE.tr().toString();
              }
              return null;
            },
            type: TextInputType.number,
            onsave: (v){
              cubit.phone=v;
            },
            hint: LocaleKeys.phone.tr(),
            dIcon: Icons.phone_android_outlined,
            label: true,
            labelText:LocaleKeys.phone.tr() ,
          ),

          CustomTextField(
            valid: (value) {
              if (value.isEmpty) {
                return LocaleKeys.ePassword.tr().toString();
              }else if(value.length < 7){
                return EasyLocalization.of(context).locale == Locale('en', 'US')?"password should be more than 6 Characters or numbers":
                "يجب ان يكون الرمز السري اكثر من 6 حروف او ارقام";
              }
            },
            onsave: (v){
              cubit.password=v;
            },
            hint: LocaleKeys.password.tr(),
            dIcon: Icons.lock,
            label: true,
            labelText:LocaleKeys.password.tr() ,
            icon: Icons.lock_outline,
          ),


        ],
      ),
    );
  }
}
