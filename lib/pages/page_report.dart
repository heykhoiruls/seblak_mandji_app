import 'package:flutter/material.dart';
import 'package:seblak_mandji_app/configs/config_apps.dart';
import 'package:seblak_mandji_app/configs/config_components.dart';

class PageReport extends StatelessWidget {
  const PageReport({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 4,
            vertical: defaultSize * 7,
          ),
          child: Column(
            children: [
              ConfigText(
                configFontText: "Ini adalah halaman Report",
                configFontColor: colorAccent,
                configFontSize: defaultSize * 3,
                configFontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
