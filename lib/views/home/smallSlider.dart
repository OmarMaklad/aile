import 'package:aile/constants.dart';
import 'package:aile/views/packageDetails/bloc/cubit.dart';
import 'package:aile/views/packageDetails/bloc/payCubit.dart';
import 'package:aile/views/packageDetails/view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'bloc/cubit.dart';



class SmallSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final cubit = HomeCubit.get(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 17),
      height: height*.2,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cubit.homeModel.packages.length,
          itemBuilder: (_,index)=>GestureDetector(
            onTap: (){
              PackageCubit.get(context).id=cubit.homeModel.packages[index].id;
              PayCubit.get(context).packageId=cubit.homeModel.packages[index].id;
              PackageCubit.get(context).lang=context.locale == Locale('en', 'US')?"en":"ar";
              PackageCubit.get(context).getPackage();
              Navigator.push(context,MaterialPageRoute(builder: (_)=>PackageDetails()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: height*.09,
              width: height*.29,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cubit.homeModel.packages[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "dinnextl bold",
                            fontSize:18,),),
                        Text("${cubit.homeModel.packages[index].cost} \$",
                          style: TextStyle(
                            fontFamily: "dinnextl bold",
                            color: Colors.white,
                            fontSize:16,),),
                        SizedBox(height:15,),
                        Text("See More",
                          style: TextStyle(
                            fontFamily: "dinnextl bold",
                            fontSize:18,),),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: height*.1,
                      width: height*.1,
                      child: Image.network(cubit.homeModel.packages[index].image,fit: BoxFit.cover,)),
                ],
              ),
            ),
          ),
        separatorBuilder: (ctx,ind)=>SizedBox(width:15,),
      ),
    );
  }
}


