import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RequireAuthenticationGuard extends RouteGuard {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  RequireAuthenticationGuard(): super(redirectTo: "/auth/");

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute<dynamic> route) {
    return firebaseAuth.currentUser != null;
  }
}
