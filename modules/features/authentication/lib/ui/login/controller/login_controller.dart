import 'dart:io';

import 'package:design_system/exception/use_case_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../domain/usecase/authentication_usecase.dart';
import 'model/login_event.dart';
import 'model/login_state.dart';

class LoginController {
  final AuthenticationUseCase useCase;

  LoginController(this.useCase);

  final _state = RxNotifier<LoginState>(LoginState());

  LoginState get state => _state.value;

  final event = RxNotifier<LoginEvent>(Idle());

  void doLogin(String email, String password) async {
    _state.value = state.copyWith(isLoading: true);

    await useCase.doLogin(email, password).onSuccess((data) {
      event.value = GoToHome();
    }).onFailure((failure) {
      treatmentError(failure);
    });

    _state.value = state.copyWith(isLoading: false);
    _state.call();
  }

  void treatmentError(Exception exception) {
    switch (exception) {
      case FirebaseAuthException():
        event.value = ShowMessageError("E-mail ou senha inválidos, preencha corretamente os dados");
      case UseCaseException():
        event.value = ShowMessageError(exception.message);
      case IOException():
        event.value = ShowMessageError("Falha na conexão, por favor, verifique se está conectado a internet");
    }
  }
}
