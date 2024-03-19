class LoginEvent {
}

class Idle extends LoginEvent {}

class GoToHome extends LoginEvent {}

class ShowMessageError extends LoginEvent {
  String messageError;

  ShowMessageError(this.messageError);
}
