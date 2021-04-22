import 'dart:io';
import 'package:aile/views/profile/bloc/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileCubit extends Cubit<EditState>{
  EditProfileCubit() : super(EditInitState());
  static EditProfileCubit get(context)=>BlocProvider.of(context);
  TextEditingController  controller =TextEditingController();
  TextEditingController  controller1 =TextEditingController();
  TextEditingController  controller2 =TextEditingController();
  TextEditingController  controller3 =TextEditingController();

  File image;
  String  name;
  var phone;
  String email;
  String password;



  Dio _dio = Dio();

  Future<void> editProfile({ String lang})async{

    emit(EditLoadingState());

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(image.path);

    _dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",
      "token":"${_prefs.getString("token")}"
    };

    try{
      final url = 'https://hloulsoft.com/aile/public/api/v1/editProfile';
      FormData formData = FormData.fromMap({
        "name":name==null?"${_prefs.getString("name")}":name,
        "phone":phone==null?"${_prefs.getString("phone")}":phone,
        "email":email==null?"${_prefs.getString("email")}":email,
        if(image.path!=null)
        "img": await MultipartFile.fromFile(image.path),
        if(password!=null)
        "password":"${password}",
      });
      print("ثانيه يحب");
      final Response response = await _dio.post(url,data: formData,options: Options(contentType: "multipart/form-data"));
      if(response.statusCode!=null&&response.statusCode == 200){
        print(response.data);
        emit(EditSuccessState());
      }else{
        emit(EditErrorState("failed UpDate"));
      }
    }catch(e){
      if(e.response!=null)
        emit(EditErrorState(e.toString()));
    }
  }
}

