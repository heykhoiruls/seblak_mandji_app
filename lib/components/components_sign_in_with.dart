// ignore_for_file: avoid_print,
// ignore_for_file: use_build_context_synchronously

import 'package:flutter_svg/flutter_svg.dart';
import '../configs/config_components.dart';
import 'package:flutter/material.dart';
import '../configs/config_apps.dart';

class ComponentsSignInWith extends StatelessWidget {
  const ComponentsSignInWith({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await controllerUser.signInWithGoogle(context);
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: colorBlack),
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/components_sign_in_with_google.svg',
                height: 24,
                width: 24,
              ),
              const SizedBox(width: defaultSize),
              const ConfigText(
                configFontText: "Masuk dengan Google",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
