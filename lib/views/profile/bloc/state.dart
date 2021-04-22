abstract class EditState {}

class EditInitState extends EditState {}

class EditSuccessState extends EditState {}

class EditLoadingState extends EditState {}

class EditErrorState extends EditState {
  String error;
  EditErrorState(this.error);
}