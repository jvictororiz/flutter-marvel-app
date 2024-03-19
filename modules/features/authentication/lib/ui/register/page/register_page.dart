import 'package:authentication/ui/register/controller/register_controller.dart';
import 'package:design_system/component/custom_input.dart';
import 'package:design_system/component/loading_button.dart';
import 'package:design_system/component/password_field.dart';
import 'package:design_system/component/snack_bar.dart';
import 'package:design_system/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controller/model/register_event.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> with WidgetsBindingObserver {
  final TextEditingController _inputLoginController = TextEditingController();
  final TextEditingController _inputPasswordController = TextEditingController();
  final TextEditingController _inputConfirmPasswordController = TextEditingController();
  final RegisterController _registerController = Modular.get();

  @override
  void initState() {
    super.initState();
    configObservers();
  }

  void configObservers() {
    _registerController.event.addListener(() {
      final currentEvent = _registerController.event.value;

      if (currentEvent is GoToHome) {
        Modular.to.pushNamed("./register");
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
        final state = _registerController.state;
        return Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 54),
            child: ListView(
              children: [
                Wrap(
                  children: [
                    Hero(
                      tag: "logo",
                      child: Image.asset('assets/images/marvel_logo.png', width: 100, height: 50),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Preencha os campos corretamente:",
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
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
                const SizedBox(height: 16),
                PasswordField(
                  onSubmitted: () {},
                  controller: _inputConfirmPasswordController,
                  hintText: "Confirme sua senha",
                ),
                const SizedBox(height: 32),
                LoadingButton(
                  loading: state.isLoading,
                  textButton: "CADASTRAR",
                  onTap: () {
                    _registerController.register(
                      _inputLoginController.text,
                      _inputPasswordController.text,
                      _inputConfirmPasswordController.text,
                    );
                  },
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      }),
    );
  }
}
