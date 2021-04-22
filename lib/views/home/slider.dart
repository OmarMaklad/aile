import 'package:aile/views/home/bloc/cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';



class OfferSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final cubit = HomeCubit.get(context);
    return Padding(
      padding:  EdgeInsets.only(top: height*.07),
      child: CarouselSlider.builder(
            itemCount:cubit.homeModel.banners.length,
            options: CarouselOptions(
              height: height*.21,
              autoPlay: true,
              autoPlayInterval: Duration(seconds:5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context,index){
              return Container(
                width: height*.54,
                margin: EdgeInsets.symmetric(
                    horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                    image:DecorationImage(
                      fit: BoxFit.cover,
                      image:NetworkImage(cubit.homeModel.banners[index].image),
                    ) ,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color:kPrimaryColor,width:1)
                ),
              );
            },
          ),
    );
  }
}
