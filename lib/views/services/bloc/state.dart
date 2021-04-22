abstract class ServiceState {}

class ServiceInitState extends ServiceState {}

class ServiceSuccessState extends ServiceState {}

class ServiceLoadingState extends ServiceState {}

class ServiceErrorState extends ServiceState {
  String error;
  ServiceErrorState(this.error);
}

