
import 'package:aile/views/memberHome/model/model.dart';
import 'package:aile/views/orderDetails/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../network.dart';


class AcceptController {
  NetWork netWork = NetWork();
  AcceptModel _acceptModel = AcceptModel();
  Future<AcceptModel> acceptOr({String lang,int id}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("token"));
    var data = await netWork.getData(url: 'begin/${id}',
        headers: {
          "language":lang,
          "secret":"0b2a14a06cd9f281dac6c19b876a7062",
          "token":"${_prefs.getString("token")}"
        });
    if (data == null || data == "internet") {
      _acceptModel = null;
      return  _acceptModel;
    } else {
      _acceptModel = AcceptModel.fromJson(data);
      print(data);
      return  _acceptModel;
    }
  }
  Future<AcceptModel> endOr({String lang,int id}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("token"));
    var data = await netWork.getData(url: 'end/${id}',
        headers: {
          "language":lang,
          "secret":"0b2a14a06cd9f281dac6c19b876a7062",
          "token":"${_prefs.getString("token")}"
        });
    if (data == null || data == "internet") {
      _acceptModel = null;
      return  _acceptModel;
    } else {
      _acceptModel = AcceptModel.fromJson(data);
      print(data);
      return  _acceptModel;
    }
  }
}
