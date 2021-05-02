import 'package:aile/generated/locale_keys.g.dart';
import 'package:aile/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';
import 'bloc/controller.dart';
import 'card.dart';
import 'model/model.dart';
import 'package:easy_localization/easy_localization.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  NotificationModel _notificationModel = NotificationModel();
  NotificationController _notificationController = NotificationController();
  bool _isLoading = true;
  String langs;

  void _getNotification() async {
    _notificationModel = await _notificationController.getNotification(
        lang: langs,
    );
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (context.locale == Locale('en', 'US')) {
      setState(() {
       langs="en";
      });
    } else {
      langs="ar";
    }
  }
  @override
  void initState() {
    _getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        CustomAppBar(
          title: LocaleKeys.notifications.tr(),
        ),
        Expanded(
          child: _notificationModel.data==null?
          Center(
            child: Text(LocaleKeys.shouldSignUp.tr(),
              style: TextStyle(fontSize: 16,
                fontFamily: "dinnextl bold",),),
          ): _isLoading
              ?Center(
                  child: SpinKitChasingDots(
                  size: 40,
                  color: kPrimaryColor,
                ))
              : _notificationModel.data.isEmpty?
                Center(
                  child: Text(LocaleKeys.noNotification.tr(),
                    style: TextStyle(fontSize: 16,
                        fontFamily: "dinnextl bold",),),
                ):
          ListView.separated(
                  itemBuilder: (cxt, index) => NotificationCard(
                    text:  context.locale == Locale('en', 'US')?_notificationModel.data[index].bodyEn:
                    _notificationModel.data[index].body,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (ctx, ind) => Divider(),
                  itemCount: _notificationModel.data.length,
                ),
        ),
      ],
    );
  }
}
