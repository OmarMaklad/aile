import 'package:aile/views/changePassword/cubit/cubit.dart';
import 'package:aile/views/forgetPassword/cubit/cubit.dart';
import 'package:aile/views/login/bloc/cubit.dart';
import 'package:aile/views/memberDetails/bloc/cubit.dart';
import 'package:aile/views/onBording/bloc/cubit.dart';
import 'package:aile/views/packageDetails/bloc/cubit.dart';
import 'package:aile/views/packageDetails/bloc/payCubit.dart';
import 'package:aile/views/profile/bloc/cubit.dart';
import 'package:aile/views/profile/bloc/profileCubit.dart';
import 'package:aile/views/services/bloc/cubit.dart';
import 'package:aile/views/signUp/bloc/cubit.dart';
import 'package:aile/views/splash/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid;
  var initializationSettingsIos;
  var initializationSettings;



  void _showNotification(var title , var body)async{
    await _demoNotification(title , body);
  }
  Future<void> _demoNotification(var title , var body)async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel_Name', 'channel_Description',importance: Importance.max,
        priority: Priority.high , ticker: 'test ticker');
    var iosChannelSpecifics = IOSNotificationDetails(sound: "slow_spring_board.aiff");
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosChannelSpecifics);
    flutterLocalNotificationsPlugin.show(0,title,body, platformChannelSpecifics,payload: 'Custom_Sound');
  }
  Future onDidReceiveLocalNotification(int id , String title , String body ,String payload)async{
    await showDialog(context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: ()async{
              Navigator.of(context , rootNavigator: true).pop();
              // await Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondRoute()));
            },
            isDefaultAction: true,
            child: Text('ok'),
          )
        ],
      ),
    );
  }
  Future onSelectNotification(String payload)async{
    if(payload!=null){
      // debugPrint('Notification payload $payload');
    }
    // await Navigator.push(context, MaterialPageRoute(builder: (context)=> Notifications()));
  }

  @override
  void initState() {
    _showNotification("hi", "hiBody");
    initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/launcher_icon');
    initializationSettingsIos = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIos);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    super.initState();
// FirebaseMessaging().getToken().then((value) => print(value));
    FirebaseMessaging().configure(
      onMessage: (Map<String, dynamic> message) async {
        // print("onMessage: $message");
        _showNotification(message['notification']['title'],message['notification']['body']);
        FlutterRingtonePlayer.playNotification(
          looping: false, // Android only - API >= 28
          volume: 0.1, // Android only - API >= 28
          asAlarm: false, // Android only - all APIs
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        // print("onLaunch: $message");
        _showNotification(message['notification']['title'],message['notification']['body']);
        FlutterRingtonePlayer.playNotification(
          looping: false, // Android only - API >= 28
          volume: 0.1, // Android only - API >= 28
          asAlarm: false, // Android only - all APIs
        );
      },
      onResume: (Map<String, dynamic> message) async {
        // print("onResume: $message");
        _showNotification(message['notification']['title'],message['notification']['body']);
        FlutterRingtonePlayer.playNotification(
          looping: false, // Android only - API >= 28
          volume: 0.1, // Android only - API >= 28
          asAlarm: false, // Android only - all APIs
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (_)=>LoginCubit()),
      BlocProvider(create: (_)=>SignUpCubit()),
      BlocProvider(create: (_)=>ForgetCubit()),
      BlocProvider(create: (_)=>ChangeCubit()),
      BlocProvider(create: (_)=>ProfileCubit()),
      BlocProvider(create: (_)=>PayCubit()),
      BlocProvider(create: (_)=>EditProfileCubit()),
      BlocProvider(create: (_)=>PackageCubit()),
      BlocProvider(create: (_)=>ServiceCubit()),
      BlocProvider(create: (_)=>OrderCubit()),
        BlocProvider.value(value: OnBoardCubit()..getCondition(lang: EasyLocalization.of(context).locale == Locale('en', 'US')?"en":"ar"),),
        BlocProvider.value(value: ProfileCubit()..getProfile(lang: EasyLocalization.of(context).locale == Locale('en', 'US')?"en":"ar"),),

      ],
      child: MaterialApp(
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
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
