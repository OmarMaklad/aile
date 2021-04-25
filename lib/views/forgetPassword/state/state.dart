abstract class ForgetState {}

class ForgetInitState extends ForgetState {}

class ForgetSuccessState extends ForgetState {}

class ForgetLoadingState extends ForgetState {}

class ForgetErrorState extends ForgetState {
  String error;
  ForgetErrorState(this.error);
}