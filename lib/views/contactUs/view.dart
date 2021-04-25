import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/contactUs/submit.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import 'cubit/cubit.dart';
import 'form.dart';


class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>ContactUsCubit(),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text(LocaleKeys.contactUs.tr(),style: TextStyle(
              fontFamily: "dinnextl bold",
              fontSize:22,),)
        ),
        body: ListView(
          children: [
            SizedBox(height: 20,),
            ContactUsForm(),
            SizedBox(height: 60,),
            ContactUSSubmit(),

          ],
        ),
      ),
    );
  }
}
