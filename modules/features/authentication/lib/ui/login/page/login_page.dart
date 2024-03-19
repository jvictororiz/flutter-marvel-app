import 'package:authentication/ui/login/controller/login_controller.dart';
import 'package:design_system/component/custom_input.dart';
import 'package:design_system/component/loading_button.dart';
import 'package:design_system/component/password_field.dart';
import 'package:design_system/component/snack_bar.dart';
import 'package:design_system/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controller/model/login_event.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  final LoginController _loginController = Modular.get<LoginController>();

  final TextEditingController _inputLoginController = TextEditingController();
  final TextEditingController _inputPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    configObservers();
  }

  void configObservers() {
    _loginController.event.addListener(() {
      final currentEvent = _loginController.event.value;

      if (currentEvent is GoToHome) {
        Modular.to.pushNamed("/home/");
      }
      if (currentEvent is ShowMessageError) {
        CustomSnackBar(text: currentEvent.messageError, customSnackBarType: CustomSnackBarType.Error).show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: RxBuilder(builder: (context) {
        final state = _loginController.state;
        return Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 54),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    Hero(
                      tag: "logo",
                      child: Image.asset('assets/images/marvel_logo.png', height: 80),
                    ),
                    const SizedBox(height: 40),
                    CustomInput(
                      hintText: "E-mail",
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      controller: _inputLoginController,
                    ),
                    const SizedBox(height: 16),
                    PasswordField(
                      onSubmitted: () {},
                      controller: _inputPasswordController,
                      hintText: "Senha",
                    ),
                    const SizedBox(height: 32),
                    LoadingButton(
                      loading: state.isLoading,
                      textButton: "ENTRAR",
                      onTap: () {
                        _loginController.doLogin(_inputLoginController.text, _inputPasswordController.text);
                      },
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Modular.to.popAndPushNamed("./register");
                      },
                      child: const Text(
                        "Não possui uma conta?\nRegistre-se aqui",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
