import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/orderDetails/view.dart';
import 'package:aile/widgets/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';
import 'controller/controller.dart';
import 'model.dart';
class DetailsCard extends StatefulWidget {
  final String  from;
  final String  location;
  final String  start;
  final int  id;
  final String  end;

  const DetailsCard({Key key, this.from, this.location, this.start, this.id, this.end}) : super(key: key);

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  AcceptModel _acceptModel = AcceptModel();
  AcceptController  _acceptController =AcceptController();
  bool loading = false;
  void _accept()async{
    setState(() {
      loading = true;
    });
    _acceptModel = await _acceptController.acceptOr(
        lang: EasyLocalization.of(context).locale == Locale('en', 'US')?"en":"ar",
        id: widget.id
    );
    setState(() {
      loading = false;
    });
  }
  void _end()async{
    setState(() {
      loading = true;
    });
    _acceptModel = await _acceptController.endOr(
        lang: EasyLocalization.of(context).locale == Locale('en', 'US')?"en":"ar",
        id: widget.id
    );
    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    return Container(
      height: height*.45,
      decoration: BoxDecoration(
          color: Colors.white,
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
                  height:height*.1,
                  width: height*.12,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
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
                      Text("Order #${widget.id}",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "dinnextl bold",
                            fontSize:16,)),
                    ],
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height:3,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:10,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.status.tr(),style: TextStyle(
                      fontFamily: "dinnextl bold",
                      fontSize:16,)),
                    Text(widget.from,style: TextStyle(
                      fontFamily: "dinnextl medium",
                      color: kTextColor,
                      fontSize:16,)),
                    Text(LocaleKeys.location.tr(),style: TextStyle(
                      fontFamily: "dinnextl bold",
                      fontSize:16,)),
                    Text(widget.location,style: TextStyle(
                      fontFamily: "dinnextl medium",
                      color: kTextColor,
                      fontSize:16,)),
                    Text(LocaleKeys.startTime.tr(),style: TextStyle(
                      fontFamily: "dinnextl bold",
                      fontSize:16,)),
                    Text(widget.start,style: TextStyle(
                      fontFamily: "dinnextl medium",
                      color: kTextColor,
                      fontSize:16,)),
                    Text(LocaleKeys.endTime.tr(),style: TextStyle(
                      fontFamily: "dinnextl bold",
                      fontSize:16,)),
                    Text(widget.end,style: TextStyle(
                      fontFamily: "dinnextl medium",
                      color: kTextColor,
                      fontSize:16,)),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height:height*.12,
                    child: Image.asset("assets/images/login.png"),
                  ),
                )
              ],
            ),
          ),
         loading?SpinKitChasingDots(
            color: kPrimaryColor,
           size: 20,
         ): Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallButton(onPressed: (){
                _accept();
              }, title: "Start",color: kPrimaryColor,),
              SmallButton(onPressed: (){
                _end();
              }, title: "End",color: kPrimaryColor,),
            ],
          )
        ],
      ),
    );
  }
}
