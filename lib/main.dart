import 'package:aile/views/login/bloc/cubit.dart';
import 'package:aile/views/memberDetails/bloc/cubit.dart';
import 'package:aile/views/onBording/bloc/cubit.dart';
import 'package:aile/views/packageDetails/bloc/cubit.dart';
import 'package:aile/views/profile/bloc/cubit.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/views/services/bloc/cubit.dart';
import 'package:aile/views/signUp/bloc/cubit.dart';
import 'package:aile/views/splash/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyLocalization(
      child: MyApp(),
      saveLocale: true,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      path: 'lib/Resources/Translations',
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (_)=>LoginCubit()),
      BlocProvider(create: (_)=>SignUpCubit()),
      BlocProvider(create: (_)=>ProfileCubit()),
      BlocProvider(create: (_)=>EditProfileCubit()),
      BlocProvider(create: (_)=>PackageCubit()),
      BlocProvider(create: (_)=>ServiceCubit()),
      BlocProvider(create: (_)=>OrderCubit()),
        BlocProvider.value(value: OnBoardCubit()..getCondition(lang: context.locale == Locale('en', 'US')?"en":"ar"),),
        BlocProvider.value(value: ProfileCubit()..getProfile(lang: context.locale == Locale('en', 'US')?"en":"ar"),),

      ],
      child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashView(),
      ),
    );
  }
}
