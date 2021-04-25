import 'dart:io';

import 'package:aile/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';
import 'bloc/cubit.dart';
import 'bloc/profileCubit.dart';
import 'bloc/profileState.dart';

class UserAvatar extends StatefulWidget {
  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  final picker = ImagePicker();
  File image;

  Future getImageCamera() async{
    final cubit1 = EditProfileCubit.get(context);
    final file2 = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if(file2 != null){
        cubit1.image = File(file2.path);
      }else{
        print("no image selected");
      }
    });
  }
  Future getImageGallery() async{
    final cubit1 = EditProfileCubit.get(context);
    final file2 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(file2 != null){
        cubit1.image = File(file2.path);
        // provider.images.add( File(file2.path));
      }else{
        print("no image selected");
      }
    });
  }

  void _showPickerLogo(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color:kPrimaryColor),
                      title: new Text(LocaleKeys.gallery.tr(),
                        style: TextStyle(fontSize:16, fontFamily: "dinnextl bold",),),
                      onTap: () {
                        getImageGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color:kPrimaryColor),
                    title: new Text(LocaleKeys.camera.tr(),
                      style: TextStyle(fontSize:16, fontFamily: "dinnextl bold",),),
                    onTap: () {
                      getImageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
    final cubit1 = EditProfileCubit.get(context);
    return BlocConsumer<ProfileCubit,ProfileState>(
      listener: (_, state) {
        if (state is ProfileErrorState)
          Scaffold.of(_).showSnackBar(SnackBar(
              backgroundColor: kPrimaryColor,
              content: Text(
                state.error,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "dinnextl bold",
                    fontSize: 14),
              )));
      },
        builder: (context,state){
          return state is ProfileSuccessState? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: (){
                    _showPickerLogo(context);
                  },
                  child:Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(150),
                        image: DecorationImage(
                            image:cubit1.image!=null?FileImage(cubit1.image):
                            NetworkImage(cubit.profileModel.data.image),
                            fit: BoxFit.fill),
                      ),
                      height:95,
                      width: 95,
                    ),
                  ),
                ),
              ),
              SizedBox(height:5,),
              Text(cubit.profileModel.data.name,
                style: TextStyle(color:Colors.black,fontSize:20, fontFamily: "dinnextl bold",),),
            ],
          ):Center(
              child: SpinKitChasingDots(
                size: 40,
                color: kPrimaryColor,
              ));
        },
        );
  }
}
