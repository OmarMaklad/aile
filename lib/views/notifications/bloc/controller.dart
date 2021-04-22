import 'package:aile/views/notifications/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../network.dart';


class NotificationController {
  NetWork netWork = NetWork();
  NotificationModel _notificationModel =NotificationModel();
  Future<NotificationModel> getNotification({String lang}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("api_token"));

    var data = await netWork.getData(url: 'getMyNotifications',
        headers: {
          "language":lang,
          "secret":"0b2a14a06cd9f281dac6c19b876a7062",
          "token":"${_prefs.getString("token")}"
        });
    print(data);
    if (data == null || data == "internet") {
      _notificationModel = null;
      return  _notificationModel;
    } else {
      _notificationModel = NotificationModel.fromJson(data);
      print(data);
      return  _notificationModel;
    }
  }
}
