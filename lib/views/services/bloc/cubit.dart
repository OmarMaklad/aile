import 'package:aile/views/services/bloc/state.dart';
import 'package:aile/views/services/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ServiceCubit extends Cubit<ServiceState>{
  ServiceCubit() : super(ServiceInitState());
  int id;
  String lang;
  static ServiceCubit get (context)=> BlocProvider.of(context);
  ServiceModel serviceModel;
  Dio dio = Dio();
  Future<ServiceModel> getService()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",
      "token":"${_prefs.getString("token")}"
    };
    emit(ServiceInitState());
    var response = await dio.get('https://hloulsoft.com/aile/public/api/v1/service/${1}');
    if(response.statusCode == 200){
      print(response.data);
      serviceModel = ServiceModel.fromJson(response.data);
      emit(ServiceSuccessState());
    }else{
      emit(ServiceErrorState('error'));
    }
    return serviceModel;
  }

}