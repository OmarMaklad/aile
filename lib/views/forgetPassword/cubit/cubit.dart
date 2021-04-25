import 'package:aile/views/forgetPassword/state/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetCubit extends Cubit<ForgetState>{
  ForgetCubit() : super(ForgetInitState());
  static ForgetCubit get(context)=>BlocProvider.of(context);
  String email;
 GetStorage box=GetStorage();
  Dio _dio = Dio();

  Future<void> forget({String lang})async{
    emit(ForgetLoadingState());
    _dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",

    };
    try{
      final url = 'https://hloulsoft.com/aile/public/api/v1/resetpassword';
      FormData formData = FormData.fromMap({
        "email":email,
      });
      print("nooooo");
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode!=null&&response.statusCode == 200){
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        box.write("code",response.data['code']);
        print(response.data);
        print(_prefs.getString("phone"));
        emit(ForgetSuccessState());
      }else if(response.statusCode == 200&&response.data['data']=="Not Exist"){
        emit(ForgetErrorState("check your email"));
      }
    }catch(e){
      if(e.response!=null)
        emit(ForgetErrorState(e));
    }
  }
}
