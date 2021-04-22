import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/favoruits/bloc/cubit.dart';
import 'package:aile/views/favoruits/bloc/state.dart';
import 'package:aile/views/memberDetails/view.dart';
import 'package:aile/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import 'favCard.dart';

class FavouritesView extends StatefulWidget {
  @override
  _FavouritesViewState createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  bool loged;
 void _log()async{
   SharedPreferences _prefs =await SharedPreferences.getInstance();
   if(_prefs.getString("token")==null){
     setState(() {
       loged=false;
     });
   }else{
     setState(() {
       loged=true;
     });
   }
 }

 @override
  void initState() {
    _log();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final cubit = FavCubit.get(context);
    return Column(
      children: [
        CustomAppBar(title:LocaleKeys.fav.tr(),),
       loged==false?
       Padding(
         padding:  EdgeInsets.only(top: height*.3),
         child: Center(
           child: Text(LocaleKeys.shouldSignUp.tr(),
             style: TextStyle(fontSize: 16,
               fontFamily: "dinnextl bold",),),
         ),
       ): BlocConsumer<FavCubit,FavState>(
          listener: (_,state)=>null,
          builder:(_,state)=>
          state is FavSuccessState?
          cubit.favModel.data.isEmpty?
              Padding(
                padding: EdgeInsets.only(top: height*.3),
                child: Text(LocaleKeys.noFav.tr(),style: TextStyle(
                fontFamily: "dinnextl bold",
                 fontSize:18,)),
              ):Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing:20,
                      childAspectRatio: 1.4/1.4
                  ),
                  itemBuilder:(ctx,index)=>Padding(
                    padding: EdgeInsets.symmetric(horizontal:10),
                    child: FavCard(
                      name: cubit.favModel.data[index].name,
                      image:cubit.favModel.data[index].image,
                      rate: cubit.favModel.data[index].rating.toInt(),
                      id: cubit.favModel.data[index].id,
                      route: MemberDetails(
                        id: cubit.favModel.data[index].id,
                          lang:context.locale == Locale('en', 'US')?"en":"ar" ,
                      ),
                    ),
                  ),
                  itemCount: cubit.favModel.data.length),
            ),
          ):Padding(
            padding: EdgeInsets.only(top: height*.3),
            child:  SpinKitChasingDots(
              size: 40,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
