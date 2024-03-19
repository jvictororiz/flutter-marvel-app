class RegisterEvent {
}

class Idle extends RegisterEvent {}

class GoToHome extends RegisterEvent {}

class ShowMessageError extends RegisterEvent {
  String messageError;

  ShowMessageError(this.messageError);
}
