abstract class ChangeState {}

class ForgetInitState extends ChangeState {}

class ForgetSuccessState extends ChangeState {}

class ForgetLoadingState extends ChangeState {}

class ForgetErrorState extends ChangeState {
  String error;
  ForgetErrorState(this.error);
}