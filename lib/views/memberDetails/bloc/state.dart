abstract class OrderState {}

class OrderInitState extends OrderState {}

class OrderSuccessState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderErrorState extends OrderState {
  String error;
  OrderErrorState(this.error);
}

class SOrderInitState extends OrderState {}

class SOrderSuccessState extends OrderState {}

class SOrderLoadingState extends OrderState {}

class SOrderErrorState extends OrderState {
  String error;
  SOrderErrorState(this.error);
}


