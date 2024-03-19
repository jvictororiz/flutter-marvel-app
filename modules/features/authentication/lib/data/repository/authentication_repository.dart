
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

import '../dataSource/authentication_service.dart';

class AuthenticationRepository {
  final AuthenticationService _authenticationService;

  AuthenticationRepository(this._authenticationService);

  Future<Result<UserCredential, Exception>> doLogin(String email, String password) {
    return _authenticationService.doLogin(email, password);
  }

  Future<Result<UserCredential, Exception>> doNewRegister(String email, String password) {
    return _authenticationService.registerUser(email, password);
  }
}
