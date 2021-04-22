abstract class ProfileState {}

class ProfileInitState extends ProfileState {}

class ProfileSuccessState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  String error;
  ProfileErrorState(this.error);
}