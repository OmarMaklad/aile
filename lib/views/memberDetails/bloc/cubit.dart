import 'package:aile/views/memberDetails/bloc/state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderCubit extends Cubit<OrderState>{
  OrderCubit() : super(OrderInitState());
  static OrderCubit get(context)=>BlocProvider.of(context);
  TextEditingController controller =TextEditingController();
  TextEditingController controller1 =TextEditingController();
  int id;
  String date;
  String sTime;
  String eTime;
  String address;
  String type;
  String counter;

  Dio dio = Dio();

  Future<void> sendOrder({String lang})async{
    emit(OrderLoadingState());

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",
      "token":"${_prefs.getString("token")}"
    };
    print(_prefs.getString("api_token"));
    try{
      final url = 'https://hloulsoft.com/aile/public/api/v1/order';
      FormData formData = FormData.fromMap({
       "member_id":3,
        "dating":date,
        "start_time":sTime,
        "end_time":eTime,
        "address":address,
      });
      print("ثانيه يحب");
      final Response response = await dio.post(url,data: formData,options: Options(contentType: "multipart/form-data"));
      if(response.statusCode!=null&&response.statusCode == 200&&response.data["msg"]=="Ordered Successfully"){
        print("احا الشبشب ضاع يا جيمى");
        print(response.data);
        emit(OrderSuccessState());
      }else{
        emit(OrderErrorState(response.data["msg"]));
      }
    }catch(e){
      emit(OrderErrorState(e.toString()));
    }
  }
  Future<void> sendSpatialOrder({String lang})async{
    emit(SOrderLoadingState());
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",
      "token":"${_prefs.getString("token")}"
    };
    print(_prefs.getString("api_token"));
    try{
      final url = 'https://hloulsoft.com/aile/public/api/v1/orderpackage';
      FormData formData = FormData.fromMap({
       "member_id":id,
        "dating":date,
        "start_time":sTime,
        "end_time":eTime,
        "address":address,
        "type":type,
        "counter":counter,
      });
      print("ثانيه يحب");
      final Response response = await dio.post(url,data: formData,options: Options(contentType: "multipart/form-data"));
      if(response.statusCode!=null&&response.statusCode == 200&&response.data["msg"]=="Ordered Successfully"){
        print("احا الشبشب ضاع يا جيمى");
        print(response.data);
        emit(SOrderSuccessState());
      }else{
        emit(SOrderErrorState(response.data["msg"]));
      }
    }catch(e){
      emit(SOrderErrorState(e.toString()));
    }
  }
}

