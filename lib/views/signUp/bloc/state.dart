abstract class SignUpState {}

class SignUpInitState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  String error;
  SignUpErrorState(this.error);
}