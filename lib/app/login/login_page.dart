import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrgs_mobile/app/login/login_controller.dart';
import 'package:ufrgs_mobile/utils/colors.dart';
import 'package:ufrgs_mobile/utils/keyboard_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        dismissKeyboard(context);
      },
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.white,
        body: Form(
          key: _formKey,
          child: Observer(
            builder: (_) {
              if (controller.loading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/ic_launcher_round.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: userController,
                            obscureText: false,
                            focusNode: emailFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Cartão ufrgs',
                            ),
                            onFieldSubmitted: (term) {
                              emailFocus.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(passwordFocus);
                            },
                            validator: controller.validateUsername,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            focusNode: passwordFocus,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Senha',
                            ),
                            validator: controller.validatePassword,
                          ),
                          const SizedBox(height: 46),
                          SizedBox(
                            width: double.infinity,
                            height: 46,
                            child: RaisedButton(
                              onPressed: () {
                                dismissKeyboard(context);
                                controller.onPressLogin(
                                  _formKey,
                                  userController.text,
                                  passwordController.text,
                                );
                              },
                              color: AppColors.red,
                              child: const Text(
                                'Entrar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
