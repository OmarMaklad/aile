import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants.dart';
import 'controller/controller.dart';
class PreviousCard extends StatefulWidget {
  final String image;
  final String name;
  final int id;
  final String sTime;
  final String eTime;

  const PreviousCard({Key key, this.image, this.name, this.sTime, this.eTime, this.id}) : super(key: key);
  @override
  _PreviousCardState createState() => _PreviousCardState();
}

class _PreviousCardState extends State<PreviousCard> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height*.22,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage("assets/images/card.png"),
              fit: BoxFit.cover
          )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(maxRadius: 25,backgroundImage: NetworkImage(widget.image),),
              SizedBox(width: height*.01,),
              Text(widget.name,style: TextStyle(
                fontFamily: "dinnextl medium",
                fontSize:16,)),

              Icon(Icons.edit,size:18,color: Colors.deepPurple,),
              GestureDetector(
                onTap: (){
                  showDialog(context: context,builder:(_)=>AlertDialog(
                    backgroundColor: Colors.transparent,
                    content: StartRating(id: widget.id,),
                  ));
                },
                child: Text( EasyLocalization.of(context).locale == Locale('en', 'US')?
                "Make Rate":
                "اضف تقييمك",style: TextStyle(
                  fontFamily: "dinnextl medium",
                  color: Colors.deepPurple,
                  fontSize:16,)),
              ),
            ],
          ),
          SizedBox(height: height*.04,),
          Row(
            children: [
              Text(LocaleKeys.startTime.tr(),style: TextStyle(
                fontFamily: "dinnextl medium",
                color: Colors.white,
                fontSize:14,)),
              SizedBox(width:5,),
              Icon(Icons.access_alarms_rounded,color: Colors.white,size:17,),
              SizedBox(width:3,),
              Text(widget.sTime,style: TextStyle(
                fontFamily: "dinnextl medium",
                color: Colors.white,
                fontSize:14,)),
            ],
          ),
          SizedBox(height: height*.01,),
          Row(
            children: [
              Text(LocaleKeys.endTime.tr(),style: TextStyle(
                fontFamily: "dinnextl medium",
                color: Colors.white,
                fontSize:14,)),
              SizedBox(width:5,),
              Icon(Icons.access_alarms_rounded,color: Colors.white,size:17,),
              SizedBox(width:3,),
              Text(widget.eTime,style: TextStyle(
                fontFamily: "dinnextl medium",
                color: Colors.white,
                fontSize:14,)),
            ],
          ),
        ],
      ),
    );
  }

}

class StartRating extends StatefulWidget {
  final int id;
  StartRating({ this.id}) ;
  @override
  StartRatingState createState() => StartRatingState();
}

class StartRatingState extends State<StartRating> {
  static int starsCount = 0;
  ReservationController _reservationController =ReservationController();
  bool _load = false;
  String comment;

  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    return Container(
      height: height*.55,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child:Column(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(ProfileCubit.get(context).profileModel.data.image), maxRadius:35,),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("ماهو تقييمك؟",style: TextStyle( fontFamily: "dinnextl regular"),),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical:10),
            child: Stack(
              children: [
                _drawStars(starsCount),
                _drawStarsToAction(),

              ],
            ),
          ),
          CustomTextField(
            hint: "desc",
            line: true,
            onsave: (v){
              comment=v;
            },
          ),
          _load?Center(
              child: SpinKitChasingDots(
                size: 40,
                color: kPrimaryColor,
              )):CustomButton(
              onPressed: ()async{
                setState(() {
                  _load= true;
                });
                await _reservationController.rate(
                  id: widget.id,
                  comment: comment,
                  rate: starsCount,
                  lang: EasyLocalization.of(context).locale == Locale('en', 'US')?"en":"ar",
                ).then((value) => Navigator.pop(context));
            setState(() {
              starsCount =0;
            });

          }, title:LocaleKeys.send.tr())
        ],
      ),
    );
  }
  Widget _drawStars(int num) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < num; i++)
          Icon(
            Icons.star,
            color: Colors.yellow,
            size:30,
          ),
        for(int j = 0 ; j < 5 - num ; j++)
          Icon(
            Icons.star,
            color: kTextColor,
            size: 30,
          ),
      ],
    );
  }
  Widget _drawStarsToAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: (){
              setState(() {
                starsCount = 1;
                print(starsCount.toString());
              });
            },
            child: Icon(
              Icons.star,
              color: Colors.transparent,
              size: 30,
            )),
        GestureDetector(
            onTap: (){
              setState(() {
                starsCount = 2;
                print(starsCount.toString());
              });
            },
            child: Icon(
              Icons.star,
              color: Colors.transparent,
              size: 30,
            )),
        GestureDetector(
            onTap: (){
              setState(() {
                starsCount = 3;
                print(starsCount.toString());
              });
            },
            child: Icon(
              Icons.star,
              color: Colors.transparent,
              size: 30,
            )),
        GestureDetector(
            onTap: (){
              setState(() {
                starsCount = 4;
                print(starsCount.toString());
              });
            },
            child: Icon(
              Icons.star,
              color: Colors.transparent,
              size:30,
            )),
        GestureDetector(
            onTap: (){
              setState(() {
                starsCount = 5;
                print(starsCount.toString());
              });
            },
            child: Icon(
              Icons.star,
              color: Colors.transparent,
              size: 30,
            )),
      ],
    );
  }
}
