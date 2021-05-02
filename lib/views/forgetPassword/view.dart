import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/changePassword/cubit/cubit.dart';
import 'package:aile/views/changePassword/view.dart';
import 'package:aile/views/forgetPassword/state/state.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:aile/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';
import 'cubit/cubit.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> forgetKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = ForgetCubit.get(context);
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
        key:forgetKey,
        child: ListView(
          children: [
          SizedBox(height: height*.07,),
            // SizedBox(
            //     height: height*.3,
            //     child: Image.asset("assets/images/forget.png")),
            // SizedBox(height: height*.04),
            CustomTextField(
              valid: (val){
                if(val.isEmpty){
                  return LocaleKeys.eEmail.tr();
                }
                return null;
              },
              onsave: (v){
                cubit.email=v;
                ChangeCubit.get(context).email=v;
              },
              hint: LocaleKeys.email.tr(),
              dIcon: Icons.mail_outline,
              label: true,
            ),
            SizedBox(height: height*.07,),

            BlocConsumer<ForgetCubit,ForgetState>(
                listener: (_,state){
                  if(state is ForgetErrorState )
                    Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: kPrimaryColor,content: Text(state.error,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      ),)));
                  if(state is ForgetSuccessState ){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ChangePassword()));
                  }
                },
                builder:(_,state)=>state is ForgetLoadingState ? Center(
                  child: SpinKitChasingDots(
                    size: 20,
                    color: kPrimaryColor,
                  ),
                ) : CustomButton(onPressed: (){
                 if(forgetKey.currentState.validate()){
                   cubit.forget(lang:  context.locale == Locale('en', 'US')?"en":"ar");
                 }
                }, title: LocaleKeys.send.tr()))

          ],
        ),
      ),
    );
  }
}
