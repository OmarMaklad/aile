abstract class PayState {}

class PayInitState extends PayState {}

class PaySuccessState extends PayState {}

class PayLoadingState extends PayState {}

class PayErrorState extends PayState {
  String error;
  PayErrorState(this.error);
}

