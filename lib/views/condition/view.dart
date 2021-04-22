import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/onBording/bloc/cubit.dart';
import 'package:aile/views/onBording/model/model.dart';
import 'package:aile/widgets/long_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../constants.dart';


class ConditionView extends StatefulWidget {
  final String lang;
  const ConditionView({Key key, this.lang}) : super(key: key);
  @override
  _ConditionViewState createState() => _ConditionViewState();
}

class _ConditionViewState extends State<ConditionView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
          title: Text(LocaleKeys.conditions.tr(),style: TextStyle(
            fontFamily: "dinnextl bold",
            fontSize:22,),)
      ),
      body:ListView(
        children: [
          LongText(text:OnBoardCubit.get(context).boardingModel.data[0].value),
        ],
      ),
    );
  }
}
