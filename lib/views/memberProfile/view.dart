import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/views/profile/userAvatar.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../constants.dart';

class MemberProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
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
            read: true,
            hint: cubit.profileModel.data.name,
            dIcon: Icons.person,
          ),
          CustomTextField(
            hint: cubit.profileModel.data.email,
            dIcon: Icons.email,
            read: true,
          ),
          CustomTextField(
            hint:cubit.profileModel.data.phone,
            dIcon: Icons.phone_android_outlined,
            read: true,
          ),
        ],
      ),
    );
  }
}
