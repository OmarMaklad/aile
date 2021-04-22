
import 'package:aile/views/contactUs/state/state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactUsCubit extends Cubit<ConUsState>{
  ContactUsCubit() : super(ConUsInitState());
  static ContactUsCubit get(context)=>BlocProvider.of(context);
  GlobalKey<FormState> conUsKey = GlobalKey<FormState>();
  TextEditingController controller =TextEditingController();
  TextEditingController controller1 =TextEditingController();
  TextEditingController controller2 =TextEditingController();
  TextEditingController controller3 =TextEditingController();
  TextEditingController controller4 =TextEditingController();

  String  name;
  String  email;
  var phone;
  String message;
  int type;



  Dio _dio = Dio();

  Future<void> sendContact()async{

    emit(ConUsLoadingState());

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    try{
      final url = 'https://hloulsoft.com/aile/public/api/v1/contact';
      FormData formData = FormData.fromMap({
        "name":name,
        "email":email,
        "phone":"+966${phone}",
        "message":message,
        "subject":type,
      });
      print("ثانيه يحب");
      final Response response = await _dio.post(url,data: formData);
      if(response.statusCode!=null&&response.statusCode == 200){
        emit(ConUsSuccessState());
        print("الشكوى لغير الله مذلة");
      }else if(response.statusCode != 200){
        emit(ConUsErrorState(response.data["data"]));
      }
    }catch(e){
      if(e.response!=null)
        emit(ConUsErrorState(e.toString()));
    }
    return ;
  }
}

