// ignore_for_file: prefer_const_constructors,
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../components/components_icon.dart';
import '../../components/components_auth_header.dart';
import '../../components/components_button.dart';
import '../../components/components_input.dart';

import '../../configs/config_apps.dart';

class PageSignIn extends StatelessWidget {
  const PageSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(defaultSize),
                child: ComponentsIcon(),
              ),
              ComponentsAuthHeader(
                textPage: "Login",
              ),
              SizedBox(height: defaultSize * 3),
              ComponentsInput(
                controller: user.controllerEmail,
                textTitle: "Email",
                textObscure: false,
              ),
              ComponentsInput(
                controller: user.controllerPassword,
                textTitle: "Kata Sandi",
                textObscure: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultSize * 1.25,
                ),
                child: Column(
                  children: [
                    SizedBox(height: defaultSize * 2),
                    ComponentsButton(
                      text: "Masuk",
                      color: colorBackground,
                      onTap: () {
                        controllerUser.signUserIn(context, user);
                      },
                    ),
                  ],
                ),
              ),
              // SizedBox(height: defaultSize * 4),
              // ComponentsSignInWith(),
              // SizedBox(height: defaultSize * 4),
              // ComponentsAuthQuestion(
              //   textQuestion: "belum punya akun ? ",
              //   textStatement: "Buat sekarang",
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       transitionRight(
              //         PageSignUp(),
              //       ),
              //     );
              //     user.controllerEmail.clear();
              //     user.controllerPassword.clear();
              //   },
              // ),
              SizedBox(height: defaultSize * 3),
            ],
          ),
        ),
      ),
    );
  }
}
