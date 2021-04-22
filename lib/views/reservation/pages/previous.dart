import 'package:aile/constants.dart';
import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/reservation/card.dart';
import 'package:aile/views/reservation/model/model.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class Previous extends StatelessWidget {
  final  PreviousModel previousModel ;

  const Previous({Key key, this.previousModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return previousModel.pervious.isEmpty?
        Center(child: Text(LocaleKeys.emptyOrders.tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),))
    :ListView.separated(
        itemBuilder: (context,index)=>PreviousCard(
          image: previousModel.pervious[index].memberImg,
          name: previousModel.pervious[index].memberName,
          id: previousModel.pervious[index].id,
          eTime: previousModel.pervious[index].endTime,
          sTime: previousModel.pervious[index].startTime,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        separatorBuilder: (ctx,ind)=>SizedBox(height:15),
        itemCount:previousModel.pervious.length);
  }
}
