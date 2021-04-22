abstract class VerificationState {}

class VerificationInitState extends VerificationState {}

class VerificationSuccessState extends VerificationState {}

class VerificationLoadingState extends VerificationState {}

class VerificationErrorState extends VerificationState {
  String error;
  VerificationErrorState(this.error);
}