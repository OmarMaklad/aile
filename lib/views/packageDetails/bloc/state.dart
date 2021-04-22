abstract class PackageState {}

class PackageInitState extends PackageState {}

class PackageSuccessState extends PackageState {}

class PackageLoadingState extends PackageState {}

class PackageErrorState extends PackageState {
  String error;
  PackageErrorState(this.error);
}

