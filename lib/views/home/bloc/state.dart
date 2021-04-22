abstract class BannerState {}

class BannerInitState extends BannerState {}

class BannerSuccessState extends BannerState {}

class BannerLoadingState extends BannerState {}

class BannerErrorState extends BannerState {
  String error;
  BannerErrorState(this.error);
}

