import 'package:authentication/data/repository/authentication_repository.dart';
import 'package:authentication/domain/usecase/authentication_usecase.dart';
import 'package:authentication/ui/register/controller/register_controller.dart';
import 'package:authentication/ui/register/page/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../data/dataSource/authentication_service.dart';
import '../data/dataSource/firebase/authentication_firebase.dart';
import '../ui/login/controller/login_controller.dart';
import '../ui/login/page/login_page.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.add<AuthenticationService>(() => AuthenticationFirebase(i()));
    i.add(() => AuthenticationRepository(i()));
    i.add(() => AuthenticationUseCase(i()));
    i.add(() => LoginController(i()));
    i.add(() => RegisterController(i()));
  }

  @override
  void routes(RouteManager r) {
    r.child("/login", child: (context) => const LoginPage());
    r.child("/register", child: (context) => const RegisterPage());
  }
}
