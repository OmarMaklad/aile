abstract class ResendState {}

class ResendInitState extends ResendState {}

class ResendSuccessState extends ResendState {}

class ResendLoadingState extends ResendState {}

class ResendErrorState extends ResendState {
  String error;
  ResendErrorState(this.error);
}