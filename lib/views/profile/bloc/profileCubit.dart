import 'package:aile/views/profile/bloc/profileState.dart';
import 'package:aile/views/profile/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileInitState());

  static ProfileCubit get (context)=> BlocProvider.of(context);
  ProfileModel profileModel;
  Dio dio = Dio();

  Future<ProfileModel> getProfile({String lang})async{
    emit(ProfileInitState());
    SharedPreferences _prefs = await SharedPreferences.getInstance();


    dio.options.headers = {
      "language":lang,
      "secret":"0b2a14a06cd9f281dac6c19b876a7062",
      "token":"${_prefs.getString("token")}"
    };

    try{
      var response = await dio.get('https://hloulsoft.com/aile/public/api/v1/profile');
      if(response.statusCode == 200){
        print(response.data);
        print("حا الشبشب ضاع");
        profileModel = ProfileModel.fromJson(response.data);
        _prefs.setString("phone", response.data['data']['phone']);
        _prefs.setString("name", response.data['data']['name']);
        _prefs.setString("email", response.data['data']['email']);
        print(_prefs.getString("phone"));
        print(_prefs.getString("name"));
        print(_prefs.getString("email"));
        emit(ProfileSuccessState());
      }else{
        emit(ProfileErrorState('enter net error'));
      }
    }catch(e){
      print(e.toString()) ;
    }
    return profileModel;
  }

}