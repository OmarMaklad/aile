import 'package:aile/views/changePassword/state/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeCubit extends Cubit<ChangeState>{
  ChangeCubit() : super(ForgetInitState());
  static ChangeCubit get(context)=>BlocProvider.of(context);
  String password;
  String email;
  int code;
 GetStorage box=GetStorage();
  Dio _dio = Dio();

  Future<void> change({String lang})async{
    emit(ForgetLoadingState());
    _dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",

    };
    try{
      final url = 'https://hloulsoft.com/aile/public/api/v1/newpassword';
      FormData formData = FormData.fromMap({
        "email":email,
        "code":code,
        "password":password,
      });
      print("nooooo");
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode!=null&&response.statusCode == 200){
        print(response.data);
        emit(ForgetSuccessState());
      }else if(response.statusCode == 200&&response.data['data']=="Not Exist"){
        emit(ForgetErrorState("check your email and code"));
      }
    }catch(e){
      if(e.response!=null)
        emit(ForgetErrorState(e));
    }
  }
}
