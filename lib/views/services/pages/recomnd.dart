import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/favoruits/favCard.dart';
import 'package:aile/views/memberDetails/view.dart';
import 'package:aile/views/services/bloc/cubit.dart';
import 'package:aile/views/services/bloc/state.dart';
import 'package:aile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants.dart';

class Recomended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final cubit = ServiceCubit.get(context);
    return BlocConsumer<ServiceCubit,ServiceState>(
        listener: (_,state)=>null,
        builder:(_,state)=> state is ServiceSuccessState?Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: GridView.builder(
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:20,
                childAspectRatio: 1.4/1.4
            ),
            itemBuilder:(ctx,index)=>Padding(
              padding: EdgeInsets.symmetric(horizontal:10),
              child: FavCard(
                fav: false,
               route: MemberDetails(
                 id: cubit.serviceModel.recommend[index].id,
                 lang:context.locale == Locale('en', 'US')?"en":"ar",
               ),
               name: cubit.serviceModel.recommend[index].name,
               rate:cubit.serviceModel.recommend[index].rating.toInt(),
                image: cubit.serviceModel.recommend[index].image,
              ),
            ),
            itemCount:cubit.serviceModel.recommend.length),
      ):Center(
    child: SpinKitChasingDots(
    size: 40,
    color: kPrimaryColor,
    )),
    );
  }
}

