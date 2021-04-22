abstract class OnBoardState {}

class OnBoardInitState extends OnBoardState {}

class OnBoardSuccessState extends OnBoardState {}

class OnBoardLoadingState extends OnBoardState {}

class OnBoardErrorState extends OnBoardState {
  String error;
  OnBoardErrorState(this.error);
}
