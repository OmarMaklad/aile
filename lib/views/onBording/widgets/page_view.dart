import 'package:aile/views/onBording/bloc/cubit.dart';
import 'package:aile/views/onBording/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../constants.dart';
import 'carousel_content.dart';

class Carousel extends StatelessWidget {
  final PageController pageController;
  Carousel(this.pageController);
  @override
  Widget build(BuildContext context) {
    final cubit=OnBoardCubit.get(context);
    return Container(
      height:MediaQuery.of(context).size.height*.2,
      child: BlocConsumer<OnBoardCubit,OnBoardState>(
        listener: (_,state)=>null,
        builder:(_,state)=> state is OnBoardSuccessState?PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children : [
            CarouselContent("1.png",cubit.boardingModel.data[0].value),
            CarouselContent("2.png",cubit.boardingModel.data[1].value),
          ],
        ):Center(
          child: SpinKitChasingDots(
            size: 40,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
