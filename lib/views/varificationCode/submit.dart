import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/home/view.dart';
import 'package:aile/views/tabsScreen/view.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SubmitVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(children: [
      SizedBox(height: height * .15),
      CustomButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>TabsScreen()));
      }, title: LocaleKeys.send.tr()),
    ]);
    //
  }
}
