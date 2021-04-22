import 'package:aile/views/memberDetails/model/model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../network.dart';


class MDetailsController {
  NetWork netWork = NetWork();
 MDetailsModel _mDetailsModel = MDetailsModel();
  Future<MDetailsModel> getMember({int id,String lang}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("token"));
    var data = await netWork.getData(url: 'member/${id}',
        headers: {
          "language":lang,
          "secret":"0b2a14a06cd9f281dac6c19b876a7062",
          "token":"${_prefs.getString("token")}"
        });
    if (data == null || data == "internet") {
      _mDetailsModel = null;
      return  _mDetailsModel;
    } else {
      _mDetailsModel = MDetailsModel.fromJson(data);
      print(data);
      return  _mDetailsModel;
    }
  }

  Future<void> fav({int id,String lang}) async {
    Map<String, dynamic> _body = {
      "user_id" : id,
    };
    FormData _formData = FormData.fromMap(_body);
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response =
    await netWork.postData(url: 'favorite', formData: _formData,
        headers:{
          "language":lang,
          "secret":"0b2a14a06cd9f281dac6c19b876a7062",
          "token":"${_prefs.getString("token")}"
        });
    if (response!=null) {
      print(response['data']);
    }
    return "hhh";
  }
}
