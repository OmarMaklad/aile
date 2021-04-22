import 'package:aile/views/packageDetails/bloc/state.dart';
import 'package:aile/views/packageDetails/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PackageCubit extends Cubit<PackageState>{
  PackageCubit() : super(PackageInitState());
  int id;
  String lang;
  static PackageCubit get (context)=> BlocProvider.of(context);
  PackageModel packageModel;
  Dio dio = Dio();
  Future<PackageModel> getPackage()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",
      "token":"${_prefs.getString("token")}"
    };
    emit(PackageInitState());
    var response = await dio.get('https://hloulsoft.com/aile/public/api/v1/package/${id}');
    if(response.statusCode == 200){
      print(response.data);
      packageModel = PackageModel.fromJson(response.data);
      emit(PackageSuccessState());
    }else{
      emit(PackageErrorState('error'));
    }
    return packageModel;
  }

}