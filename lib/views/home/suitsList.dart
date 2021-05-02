import 'package:aile/constants.dart';
import 'package:aile/views/services/bloc/cubit.dart';
import 'package:aile/views/services/view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'bloc/cubit.dart';

class SuitsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final cubit = HomeCubit.get(context);
    return  SliverGrid(
        delegate:SliverChildBuilderDelegate((_,index)=>
        GestureDetector(
            onTap: (){
              print(cubit.homeModel.services[index].id);
              ServiceCubit.get(context).id = cubit.homeModel.services[index].id;
              ServiceCubit.get(context).lang = context.locale == Locale('en','US')?"en":"ar";
              ServiceCubit.get(context).getService();
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Services(
                title: cubit.homeModel.services[index].name,
              )));
              print( ServiceCubit.get(context).id );
              print( ServiceCubit.get(context).lang );
            },
            child: Container(
              width:height*.2,
              margin: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: kAccentColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: height*.12,
                      child: Image.network(cubit.homeModel.services[index].image)),
                  Text(cubit.homeModel.services[index].name,
                    style: TextStyle(
                      fontFamily: "dinnextl bold",
                      fontSize:18,),),
                ],
              ),
            ),),childCount:cubit.homeModel.services.length ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4/1.4
        ));
  }
}
