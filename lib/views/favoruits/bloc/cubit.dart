import 'package:aile/views/favoruits/bloc/state.dart';
import 'package:aile/views/favoruits/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavCubit extends Cubit<FavState>{
  FavCubit() : super(FavInitState());

  static FavCubit get (context)=> BlocProvider.of(context);
  FavModel favModel;
  Dio dio = Dio();

  Future<FavModel> getFav({String lang})async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",
      "token":"${_prefs.getString("token")}"
    };
    emit(FavInitState());
    var response = await dio.get('https://hloulsoft.com/aile/public/api/v1/favorites');
    if(response.statusCode == 200){
      print(response.data);
      favModel = FavModel.fromJson(response.data);
      emit(FavSuccessState());
    }else{
      emit(FavErrorState('error'));
    }
    return favModel;
  }

}