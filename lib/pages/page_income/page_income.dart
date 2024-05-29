import 'package:flutter/material.dart';
import '../../components/components_button.dart';
import '../../components/components_data_user.dart';
import '../../configs/config_apps.dart';

class PageIncome extends StatelessWidget {
  const PageIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultSize,
                vertical: defaultSize,
              ),
              child: ComponentsButton(
                text: "Halaman Profile",
                color: colorBar,
              ),
            ),
            ComponentsDataUser(
              id: "",
            ),
          ],
        ),
      ),
    );
  }
}
