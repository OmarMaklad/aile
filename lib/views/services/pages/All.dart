import 'package:easy_localization/easy_localization.dart';
import 'package:aile/constants.dart';
import 'package:aile/views/memberDetails/view.dart';
import 'package:aile/views/services/bloc/cubit.dart';
import 'package:aile/views/services/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final cubit = ServiceCubit.get(context);
    return BlocConsumer<ServiceCubit,ServiceState>(
      listener: (_,state)=>null,
      builder:(_,state)=>state is ServiceSuccessState? ListView.separated(
          itemBuilder: (_,index)=>GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>MemberDetails(
                lang:context.locale == Locale('en', 'US')?"en":"ar",
                id: cubit.serviceModel.all[index].id,
              )));
            },
            child: Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal:22),
                    height:height*.15,
                    width: height*.4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child:Padding(
                      padding:  EdgeInsets.symmetric(horizontal:height*.12,vertical:15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cubit.serviceModel.all[index].name,
                            style: TextStyle(
                              fontFamily: "dinnextl bold",
                              color: Colors.black,
                              fontSize:18,),),
                          SizedBox(height: 3,),
                          Text("${cubit.serviceModel.all[index].salary.toString()}\$",
                            style: TextStyle(
                              fontFamily: "dinnextl bold",
                              color: Colors.black,
                              fontSize:16,),),
                          SizedBox(height:5,),
                      Container(
                        height: height*.03,
                        child: ListView.separated(
                          itemBuilder:(ctx,index)=>Icon(Icons.star,color: Colors.yellow,size:20,),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (ctx,ind)=>SizedBox(width:2,),
                          itemCount:cubit.serviceModel.all[index].rating.toInt(),
                        ),
                      ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12,horizontal:5),
                    height:height*.12,
                    width:height*.12,
                    decoration: BoxDecoration(
                        color: kAccentColor,
                        image: DecorationImage(
                          image: NetworkImage(cubit.serviceModel.all[index].image,),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),

                ],
              ),
            ),
          ),
          separatorBuilder: (ctx,ind)=>SizedBox(height: 10,),
          itemCount:cubit.serviceModel.all.length):Center(
        child: SpinKitChasingDots(
          size: 40,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
