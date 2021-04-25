import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/views/login/view.dart';
import 'package:aile/views/signUp/bloc/cubit.dart';
import 'package:aile/views/signUp/submit.dart';
import 'package:aile/widgets/donotHave.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'completeForm.dart';
import 'package:easy_localization/easy_localization.dart';
class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    _firebaseMessaging.getToken().then((v) {
      SignUpCubit.get(context).token = v;
    });    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (_)=>SignUpCubit(),
      child: Scaffold(
        body:  BlocBuilder(
          cubit: SignUpCubit(),
          builder:(_,state)=> ListView(
            children: [
              SizedBox(
                  height: height*.35,
                  child: Image.asset("assets/images/login.png")),
              CompleteForm(),
              SignUpSubmit(),
              DoNotHave(text: LocaleKeys.signIn.tr(),
                have: LocaleKeys.donHave.tr(),
                color: Colors.black,
                route: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>Login()));
                },),
            ],
          ),
        ),
      ),
    );
  }
}
