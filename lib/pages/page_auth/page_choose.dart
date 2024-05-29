import 'package:flutter/material.dart';

import '../../components/components_button.dart';
import '../../components/components_transition.dart';
import '../../configs/config_apps.dart';
import 'page_sign_in.dart';
import 'page_sign_up.dart';

class PageChoose extends StatelessWidget {
  const PageChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultSize * 2),
            child: Column(
              children: [
                const SizedBox(height: defaultSize * 7),
                Image.asset("assets/logo.png"),
                ComponentsButton(
                  text: "Login",
                  color: colorBackground,
                  onTap: () {
                    Navigator.push(
                      context,
                      transitionRight(
                        const PageSignIn(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: defaultSize * 1.5),
                ComponentsButton(
                  text: "Sign up",
                  color: colorBackground,
                  onTap: () {
                    Navigator.push(
                      context,
                      transitionRight(
                        const PageSignUp(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: defaultSize * 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
