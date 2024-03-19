import 'package:design_system/utils/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

import '../authentication_service.dart';

class AuthenticationFirebase implements AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationFirebase(this._firebaseAuth);

  @override
  Future<Result<UserCredential, Exception>> doLogin(String email, String password) async {
    return runCatchingAsync(() => _firebaseAuth.signInWithEmailAndPassword(email: email, password: password));
  }

  @override
  Future<Result<UserCredential, Exception>> registerUser(String email, String password) async {
    return runCatchingAsync(() => _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password));
  }
}
