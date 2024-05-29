import 'package:flutter/material.dart';

import '../configs/config_apps.dart';
import '../configs/config_components.dart';

class PageOutlet extends StatelessWidget {
  const PageOutlet({super.key});

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
                configFontText: "Ini adalah halaman Outlet",
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
