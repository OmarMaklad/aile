abstract class NotificationState {}

class NotificationInitState extends NotificationState {}

class NotificationSuccessState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationErrorState extends NotificationState {
  String error;
  NotificationErrorState(this.error);
}
class DelInitState extends NotificationState {}

class DelSuccessState extends NotificationState {}

class DelLoadingState extends NotificationState {}

class DelErrorState extends NotificationState {
  String error;
  DelErrorState(this.error);
}