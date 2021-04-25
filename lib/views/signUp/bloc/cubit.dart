import 'package:aile/views/signUp/bloc/state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit() : super(SignUpInitState());
  static SignUpCubit get (context)=> BlocProvider.of(context);
  GlobalKey<FormState> signUpKey =GlobalKey<FormState>();
  Dio _dio = Dio();
  String name;
  String phone;
  String password;
  String email;
  String token;
  Future<void> signUp({String lang})async{
    emit(SignUpLoadingState());

    try{
      _dio.options.headers = {
        "language":lang,
        "secret":"0b2a14a06cd9f281dac6c19b876a7062"
      };
      final url = 'https://hloulsoft.com/aile/public/api/v1/regist';
      FormData formData = FormData.fromMap({
        "phone":"${phone}",
        "password":password,
        "name":name,
        "email":email,
        "device_token":token,
      });
      final Response response = await _dio.post(url,data: formData,);
      if(response.statusCode!=null&&response.statusCode == 200){
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("token",response.data["token"]);
        print(response.data);
        print(_prefs.getString("token"));
        emit(SignUpSuccessState());
      }else if(response.statusCode!=null&&response.statusCode == 400){
        print(response.data);
        emit(SignUpErrorState("The email has been already taken"));
      }
    }catch(e){
        emit(SignUpErrorState("The email has been already taken"));
    }

  }

}