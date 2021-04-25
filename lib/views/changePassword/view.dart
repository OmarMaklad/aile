import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/changePassword/state/state.dart';
import 'package:aile/views/login/view.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';
import 'cubit/cubit.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> forgetKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = ChangeCubit.get(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(LocaleKeys.changePassword.tr(),style: TextStyle(
            fontFamily: "dinnextl bold",
            fontSize:22,),)
      ),
      body:  Form(
        key: forgetKey,
        child: ListView(
          children: [
          SizedBox(height: height*.07,),
            CustomTextField(
              valid: (v){
                if(v.isEmpty){
                  return LocaleKeys.code.tr() ;
                }else{
                  return null;
                }
              },
              onsave: (v){
                cubit.code=int.parse(v);

              },
              hint: LocaleKeys.code.tr(),
              dIcon: Icons.code,
              type: TextInputType.number,
              label: true,
            ),
            SizedBox(height: height*.03,),
            CustomTextField(
              valid: (value) {
                if (value.isEmpty) {
                  return LocaleKeys.ePassword.tr();
                }else if(value.length < 7){
                  return context.locale == Locale('en', 'US')?"password should be more than 6 Characters or numbers":
                  "يجب ان يكون الرمز السري اكثر من 6 حروف او ارقام";
                }
              },
              onsave: (v){
                cubit.password=v;
              },
              hint: LocaleKeys.password.tr(),
              dIcon: Icons.lock,
              label: true,
            ),
            SizedBox(height: height*.07,),

            BlocConsumer<ChangeCubit,ChangeState>(
                listener: (_,state){
                  if(state is ForgetErrorState )
                    Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      ),)));
                  if(state is ForgetSuccessState ){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Login()));
                  }
                },
                builder:(_,state)=>state is ForgetLoadingState ? Center(
                  child: SpinKitChasingDots(
                    size: 20,
                    color: kPrimaryColor,
                  ),
                ) : CustomButton(onPressed: (){
                  print(cubit.code);
                 if(forgetKey.currentState.validate()){
                   cubit.change(lang: context.locale == Locale('en', 'US')?"en":"ar");
                 }
                }, title: LocaleKeys.send.tr()))

          ],
        ),
      ),
    );
  }
}
