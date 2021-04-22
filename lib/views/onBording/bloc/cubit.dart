import 'package:aile/views/onBording/bloc/state.dart';
import 'package:aile/views/onBording/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class OnBoardCubit extends Cubit<OnBoardState>{
  OnBoardCubit() : super(OnBoardInitState());

  static OnBoardCubit get (context)=> BlocProvider.of(context);
  OnBoardingModel boardingModel;

  Dio dio = Dio();

  Future<OnBoardingModel> getOnBoard({ String lang})async{
    emit(OnBoardInitState());

    dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062"
    };
    var response = await dio.get('https://hloulsoft.com/aile/public/api/v1/onboarding');
    if(response.statusCode == 200){
      print(response.data);
      boardingModel = OnBoardingModel.fromJson(response.data);
      emit(OnBoardSuccessState());
    }else{
      emit(OnBoardErrorState('error'));
    }
    return boardingModel;
  }
  Future<OnBoardingModel> getCondition({ String lang})async{
    emit(OnBoardInitState());

    dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062"
    };
    var response = await dio.get('https://hloulsoft.com/aile/public/api/v1/conditions');
    if(response.statusCode == 200){
      print(response.data);
      boardingModel = OnBoardingModel.fromJson(response.data);
      emit(OnBoardSuccessState());
    }else{
      emit(OnBoardErrorState('error'));
    }
    return boardingModel;
  }
}