import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../constants.dart';
import 'cubit/cubit.dart';


class ContactUsForm extends StatefulWidget {
  @override
  _ContactUsFormState createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm> {
  @override
  Widget build(BuildContext context) {
    final cubit = ContactUsCubit.get(context);
    final height =MediaQuery.of(context).size.height;
    return Form(
      key: cubit.conUsKey,
      child: Column(
        children: [
          CustomTextField(
            valid: (v){
              if(v.isEmpty){
                return context.locale == Locale('en', 'US')?
                "Please enter name":
                "قم بادخال الاسم";
              }
            },
            onsave: (v){
              cubit.name=v;
            },
            controller: cubit.controller,
            hint: LocaleKeys.userName.tr(),
            dIcon: Icons.person_outline,
          ),
          CustomTextField(
            valid: (v){
              if(v.isEmpty){
                return LocaleKeys.eEmail.tr();

              }
            },
            onsave: (v){
              cubit.email=v;
            },
            controller: cubit.controller1,
            hint: LocaleKeys.email.tr(),
            dIcon: Icons.email,
          ),
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return LocaleKeys.phoneE.tr();
              }
              return null;
            },
            onsave: (v){
              cubit.phone=v;
            },
            controller: cubit.controller2,
            hint: LocaleKeys.phone.tr(),
            dIcon: Icons.phone_android_outlined,
            label: true,
          ),
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return context.locale == Locale('en', 'US')?
                "Please enter type":
                "قم بادخال نوع التواصل";
              }
              return null;
            },
            onsave: (v){
              cubit.type=v;
            },
            controller: cubit.controller3,
            hint: context.locale == Locale('en', 'US')?
            " Subject":
            "نوع الرسالة",
            dIcon: Icons.send,
            label: true,
          ),
          CustomTextField(
            valid: (val) {
              if (val.isEmpty) {
                return LocaleKeys.descE.tr();
              }
            },
            onsave: (v){
              cubit.message=v;
            },
            controller: cubit.controller4,
            hint: LocaleKeys.desc.tr(),
            line: true,
          ),
        ],
      ),
    );
  }
}
