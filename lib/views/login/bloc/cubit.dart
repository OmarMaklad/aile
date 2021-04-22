import 'package:aile/views/login/bloc/state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitState());
  static LoginCubit get (context)=> BlocProvider.of(context);
  GlobalKey<FormState> loginKey =GlobalKey<FormState>();
  Dio _dio = Dio();
  String email;
  String password;
  String token;

  Future<void> signIn()async{
    emit(LoginLoadingState());
    try{
      final url = 'https://hloulsoft.com/aile/public/api/v1/login';
      FormData formData = FormData.fromMap({
        "email":email,
        "password":password,
        "device_token":token,
      });
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode!=null&&response.statusCode == 200&&response.data['data']!="Not Exist"){
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("token",response.data["token"]);
        _prefs.setString("type",response.data["data"]["role"]);
        print(_prefs.getString("type"));
        print(_prefs.getString("token"));
        print("omar"*100);
        emit(LoginSuccessState());
      }else if(response.statusCode == 200&&response.data['data']=="Not Exist"){
        emit(LoginErrorState("check your email or password"));
      }
    }catch(e){
      if(e.response!=null)
        emit(LoginErrorState(e));
    }
  }
}