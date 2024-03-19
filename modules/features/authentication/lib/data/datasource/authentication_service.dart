
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

abstract class AuthenticationService {
  Future<Result<UserCredential, Exception>> doLogin(String email, String password);

  Future<Result<UserCredential, Exception>> registerUser(String email, String password);
}
