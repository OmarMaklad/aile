import 'package:aile/views/memberDetails/model/model.dart';
import 'package:aile/views/reservation/model/model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../network.dart';


class ReservationController {
  NetWork netWork = NetWork();
  PreviousModel _previousModel = PreviousModel();
  Future<PreviousModel> getReservation({String lang}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("token"));
    var data = await netWork.getData(url: 'orders',
        headers: {
          "language":lang,
          "secret":"0b2a14a06cd9f281dac6c19b876a7062",
          "token":"${_prefs.getString("token")}"
        });
    if (data == null || data == "internet") {
      _previousModel = null;
      return  _previousModel;
    } else {
      _previousModel = PreviousModel.fromJson(data);
      print(data);
      return  _previousModel;
    }
  }

  Future<void> rate({int id,String lang,int rate,String comment}) async {
    Map<String, dynamic> _body = {
      "rate" : rate,
      "order_id" : id,
      "comment" : comment,
    };
    FormData _formData = FormData.fromMap(_body);
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response =
    await netWork.postData(url: 'rate', formData: _formData,
        headers:{
          "language":lang,
          "secret":"0b2a14a06cd9f281dac6c19b876a7062",
          "token":"${_prefs.getString("token")}"
        });
    if (response!=null) {
      print(response['data']);
      print("omar"*10);
    }
    return "hhh";
  }
}
