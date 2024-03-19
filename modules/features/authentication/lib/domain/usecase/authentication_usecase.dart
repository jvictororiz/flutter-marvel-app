import 'package:authentication/data/repository/authentication_repository.dart';
import 'package:result_dart/functions.dart';
import 'package:result_dart/result_dart.dart';
import 'package:design_system/exception/use_case_exception.dart';
import 'package:design_system/utils/string_ext.dart';

class AuthenticationUseCase {
  final AuthenticationRepository authenticationRepository;

  AuthenticationUseCase(this.authenticationRepository);

  Future<Result<Object, Exception>> doLogin(String email, String password) async {
    if (email.isEmpty) {
      return failureOf(UseCaseException("Campo 'E-mail' não pode ficar vazio"));
    }
    if (!email.isEmail()) {
      return failureOf(UseCaseException("Campo 'E-mail' está inválido"));
    }
    if (password.isEmpty) {
      return failureOf(UseCaseException("Campo 'Senha' não pode ficar vazio"));
    }
    return authenticationRepository.doLogin(email, password);
  }

  Future<Result<Object, Exception>> doNewRegister(String email, String password, String confirmPassword) async {
    if (email.isEmpty) {
      return failureOf(UseCaseException("Campo 'E-mail' não pode ficar vazio"));
    }
    if (!email.isEmail()) {
      return failureOf(UseCaseException("Campo 'E-mail' está inválido"));
    }
    if (password.isEmpty) {
      return failureOf(UseCaseException("Campo 'Senha' não pode ficar vazio"));
    }
    if(password != confirmPassword){
      return failureOf(UseCaseException("Os campos de senha não conferem"));
    }
    return authenticationRepository.doNewRegister(email, password);
  }
}
