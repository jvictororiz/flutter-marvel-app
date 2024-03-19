import 'package:authentication/di/auth_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/di/home_module.dart';
import 'package:marvel_mobile/page/splash_page.dart';

import 'guard/authentication_guard.dart';
import 'page/wildcard_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(() => FirebaseAuth.instance);
    i.add(() => FirebaseDatabase.instance);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => const SplashPage());
    r.module("/auth", module: AuthModule());
    r.module("/home", module: HomeModule(), guards: [RequireAuthenticationGuard()]);
    r.wildcard(child: (context) => const WildcardPage());
  }
}
