import 'package:aile/views/home/bloc/state.dart';
import 'package:aile/views/home/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class HomeCubit extends Cubit<BannerState>{
  HomeCubit() : super(BannerInitState());

  static HomeCubit get (context)=> BlocProvider.of(context);
 HomeModel homeModel;
  Dio dio = Dio();

  Future<HomeModel> getBanner({String lang})async{
    dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062"
    };
    emit(BannerInitState());
    var response = await dio.get('https://hloulsoft.com/aile/public/api/v1/home');
    if(response.statusCode == 200){
      print(response.data);
      homeModel = HomeModel.fromJson(response.data);
      emit(BannerSuccessState());
    }else{
      emit(BannerErrorState('error'));
    }
    return homeModel;
  }

}