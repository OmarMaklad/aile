import 'dart:io';

import 'package:aile/views/packageDetails/bloc/payState.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PayCubit extends Cubit<PayState>{
  PayCubit() : super(PayInitState());
  static PayCubit get(context)=>BlocProvider.of(context);


int packageId;



  Dio _dio = Dio();

  Future<void> payPackage({ String lang})async{
    emit(PayLoadingState());
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",
      "token":"${_prefs.getString("token")}"
    };

    try{
      print("6666666");
      print(packageId);
      final url = 'https://hloulsoft.com/aile/public/api/v1/payment/package';
      FormData formData = FormData.fromMap({
        "package_id":packageId,
      });
      print("ثانيه يحب");
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode!=null&&response.statusCode == 200){
        print(response.data);
        emit(PaySuccessState());
      }else{
        emit(PayErrorState("error"));
      }
    }catch(e){
      if(e.response!=null)
        emit(PayErrorState("error"));
    }
  }
}

