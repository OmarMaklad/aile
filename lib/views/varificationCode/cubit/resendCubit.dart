// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jeeet/Provider/views/varificationCode/state/resendState.dart';
// import 'package:jeeet/Provider/views/varificationCode/state/state.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ResendCubit extends Cubit<ResendState>{
//   ResendCubit() : super(ResendInitState());
//   static ResendCubit get(context)=>BlocProvider.of(context);
//
//   var code;
//   Dio _dio = Dio();
//
//   Future<void> resend()async{
//     SharedPreferences _prefs = await SharedPreferences.getInstance();
//     emit(ResendLoadingState());
//     print(_prefs.getString("phone"));
//     print("عظمة");
//     try{
//       final url = 'https://jeeet.net/api/resendPhoneVerify';
//       FormData formData = FormData.fromMap({
//         "phone":_prefs.getString("phone"),
//       });
//       print("nooooo");
//       final Response response = await _dio.post(url,data: formData,);
//       if(response.statusCode!=null&&response.statusCode == 200&&response.data['msg']=="success"){
//         emit(ResendSuccessState());
//       }else if(response.statusCode == 200&&response.data['msg']=="error"){
//         emit(ResendErrorState("Try again in 30 second"));
//       }
//     }catch(e){
//       if(e.response!=null)
//         emit(ResendErrorState(e.toString()));
//     }
//   }
// }
