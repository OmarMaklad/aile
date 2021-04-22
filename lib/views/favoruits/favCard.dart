import 'package:aile/views/memberDetails/data/controller.dart';
import 'package:aile/views/tabsScreen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants.dart';
import 'package:easy_localization/easy_localization.dart';

import 'bloc/cubit.dart';
class FavCard extends StatefulWidget {
  final String name;
  final String image;
  final int rate;
  final int id;
  final bool fav;
  final Widget route;

  const FavCard({Key key, this.name, this.image, this.rate, this.fav, this.route, this.id}) : super(key: key);

  @override
  _FavCardState createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {
  MDetailsController _mDetailsController =MDetailsController();
 bool like = true;
  @override
  Widget build(BuildContext context) {

    final height =MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (_)=>widget.route!=null?widget.route:null));
      },
      child: Container(
        width:height*.2,
        decoration: BoxDecoration(
            color: kAccentColor,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height:height*.06,
                    width: height*.08,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(80),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star,color: Colors.yellow,size:20,),
                        SizedBox(width: 2,),
                        Text("${widget.rate}",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "dinnextl bold",
                              fontSize:14,)),
                      ],
                    ),
                  ),
                ),
               widget.fav==false?SizedBox():
               Padding(
                 padding:  EdgeInsets.only(top:10,right:10),
                 child: Align(
                   alignment: Alignment.topRight,
                   child: GestureDetector(
                       onTap: ()async{
                         setState(() {
                           like = !like;
                         });
                         await _mDetailsController.fav(
                           id: widget.id,
                           lang:context.locale == Locale('en', 'US')?"en":"ar",
                         ).then((value) => Navigator.push(context, MaterialPageRoute(builder:(_)=>TabsScreen(screenIndex:2,))));
                       },
                       child: Icon(Icons.favorite,color:like==false?kTextColor:Colors.red,size:30)),
                 ),
               ),
              ],
            ),
            SizedBox(height:3,),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius:30,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      maxRadius: 28,
                      backgroundColor:kPrimaryColor,
                      backgroundImage:NetworkImage(widget.image),
                    ),
                  ),
                  SizedBox(height:3,),
                  Text(widget.name,style: TextStyle(
                    fontFamily: "dinnextl bold",
                    fontSize:16,)),
                ],
              ),
            ),



          ],
        ),

      ),
    );
  }
}
