abstract class ConUsState {}

class ConUsInitState extends ConUsState {}

class ConUsSuccessState extends ConUsState {}

class ConUsLoadingState extends ConUsState {}

class ConUsErrorState extends ConUsState {
  String error;
  ConUsErrorState(this.error);
}