abstract class FavState {}

class FavInitState extends FavState {}

class FavSuccessState extends FavState {}

class FavLoadingState extends FavState {}

class FavErrorState extends FavState {
  String error;
  FavErrorState(this.error);
}

