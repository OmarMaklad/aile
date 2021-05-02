import 'package:aile/constants.dart';
import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/login/view.dart';
import 'package:aile/views/profile/editSubmit.dart';
import 'package:aile/views/profile/userAvatar.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'bloc/cubit.dart';
import 'bloc/profileCubit.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
    final cubit1 = EditProfileCubit.get(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text(LocaleKeys.profile.tr(),style: TextStyle(
            fontFamily: "dinnextl bold",
            fontSize:22,),)
      ),
      body: ListView(
        children: [
          SizedBox(height: 50,),
          UserAvatar(),
          SizedBox(height: 20,),
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return LocaleKeys.userName.tr().toString();
              }
            },
            controller: cubit1.controller,
            onsave: (v){
              cubit1.name=v;
            },
            hint: cubit.profileModel.data.name,
            label: true,
            labelText:cubit.profileModel.data.name ,
            dIcon: Icons.person,
          ),
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return LocaleKeys.eEmail.tr().toString();
              }
              return null;
            },
            controller: cubit1.controller1,
            onsave: (v){
              cubit1.email=v;
            },
            hint: cubit.profileModel.data.email,
            dIcon: Icons.email,
            label: true,
            labelText:cubit.profileModel.data.email ,
          ),
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return LocaleKeys.phoneE.tr().toString();
              }
              return null;
            },
            controller: cubit1.controller2,
            onsave: (v){
              cubit1.phone=v;
            },
            hint:cubit.profileModel.data.phone,
            dIcon: Icons.phone_android_outlined,
            label: true,
            labelText:cubit.profileModel.data.phone ,
          ),
          CustomTextField(
            valid: (val){
              if(val.isEmpty){
                return LocaleKeys.ePassword.tr().toString();
              }
            },
            controller:cubit1.controller3 ,
            onsave: (v){
              cubit1.password=v;
            },
            label: true,
            labelText:LocaleKeys.changePassword.tr() ,
            hint: LocaleKeys.changePassword.tr(),
            dIcon: Icons.lock,
            icon: Icons.lock_outline,
          ),
          SizedBox(height:50,),
          SubmitEdit(),
        ],
      ),
    );
  }
}

