import 'dart:io';

import 'package:authentication/ui/register/controller/model/register_event.dart';
import 'package:authentication/ui/register/controller/model/register_state.dart';
import 'package:design_system/exception/use_case_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../domain/usecase/authentication_usecase.dart';

class RegisterController {
  final AuthenticationUseCase useCase;

  RegisterController(this.useCase);

  final _state = RxNotifier<RegisterState>(RegisterState());

  RegisterState get state => _state.value;

  final event = RxNotifier<RegisterEvent>(Idle());

  void register(String email, String password, String confirmPassword) async {
    _state.value = state.copyWith(isLoading: true);

    await useCase.doNewRegister(email, password, confirmPassword).onSuccess((data) {
      event.value = GoToHome();
    }).onFailure((failure) {
      treatmentError(failure);
    });
    _state.value = state.copyWith(isLoading: false);
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
