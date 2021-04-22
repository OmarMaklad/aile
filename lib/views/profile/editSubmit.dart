import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../constants.dart';
import 'bloc/cubit.dart';
import 'bloc/profileCubit.dart';
import 'bloc/state.dart';


class SubmitEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final cubit = ProfileCubit.get(context);
    final cubit1 = EditProfileCubit.get(context);
    return BlocConsumer<EditProfileCubit, EditState>(
      listener: (_, state) {
        if (state is EditErrorState)
          Scaffold.of(_).showSnackBar(SnackBar(
              backgroundColor: kPrimaryColor,
              content: Text(
                state.error,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              )));
        if (state is EditSuccessState) {
          cubit1.controller.clear();
          cubit1.controller1.clear();
          cubit1.controller2.clear();
          cubit1.controller3.clear();
          cubit.getProfile(lang: "en");
          Scaffold.of(_).showSnackBar(SnackBar(
            backgroundColor: kPrimaryColor,
            content: Text(
              LocaleKeys.editSuccess.tr(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )));
        }
      },
      builder: (context, state) {

        return state is EditLoadingState
            ? Center(
          child: SpinKitChasingDots(
            size: 40,
            color: kPrimaryColor,
          ),
        )
            : Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20,vertical:5),
              child: CustomButton(
              onPressed: () {
                  cubit1.editProfile(lang: context.locale == Locale('en', 'US')?"en":"ar");
              },

              title: LocaleKeys.edit.tr()),
            );
      },
    );

  }
}
