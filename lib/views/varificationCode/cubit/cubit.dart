// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jeeet/Provider/views/varificationCode/state/state.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class VerificationCubit extends Cubit<VerificationState>{
//   VerificationCubit() : super(VerificationInitState());
//   static VerificationCubit get(context)=>BlocProvider.of(context);
//
//   var code;
//   Dio _dio = Dio();
//
//   Future<void> verificationSend()async{
//     SharedPreferences _prefs = await SharedPreferences.getInstance();
//     emit(VerificationLoadingState());
//     print(_prefs.getString("phone"));
//     print("عظمة");
//     try{
//       final url = 'https://jeeet.net/api/phoneVerify';
//       FormData formData = FormData.fromMap({
//         "phone":_prefs.getString("phone"),
//         "code":code,
//       });
//       print("nooooo");
//       final Response response = await _dio.post(url,data: formData,);
//       if(response.statusCode!=null&&response.statusCode == 200&&response.data['msg']=="success"){
//
//         _prefs.setString("api_token",response.data["api_token"]);
//         print(response.data);
//         emit(VerificationSuccessState());
//       }else if(response.statusCode == 200&&response.data['msg']=="error"){
//         emit(VerificationErrorState("The code field is required"));
//       }
//     }catch(e){
//       if(e.response!=null)
//         emit(VerificationErrorState(e.toString()));
//     }
//   }
//
// }
