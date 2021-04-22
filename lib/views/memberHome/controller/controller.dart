
import 'package:aile/views/memberHome/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../network.dart';


class MOrdersController {
  NetWork netWork = NetWork();
  MOrdersModel _ordersModel = MOrdersModel();
  Future<MOrdersModel> getMOrder({String lang}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("token"));
    var data = await netWork.getData(url: 'orders/member',
        headers: {
          "language":lang,
          "secret":"0b2a14a06cd9f281dac6c19b876a7062",
          "token":"${_prefs.getString("token")}"
        });
    if (data == null || data == "internet") {
      _ordersModel = null;
      return  _ordersModel;
    } else {
      _ordersModel = MOrdersModel.fromJson(data);
      print(data);
      return  _ordersModel;
    }
  }


}
