// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../components/components_modal_bottom.dart';
import '../../components/components_header.dart';
import '../../components/components_button.dart';
import '../../components/components_input.dart';
import '../../configs/config_apps.dart';
import '../../models/model_controller.dart';

class PageKidsRecord extends StatelessWidget {
  final String id;
  const PageKidsRecord({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    ModelController user = ModelController();
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Column(
          children: [
            const ComponentsHeader(
              text: "Tambah catatan",
            ),
            const SizedBox(height: defaultSize * 2),
            Column(
              children: [
                ComponentsInput(
                  controller: user.controllerWeight,
                  textTitle: "Berat Badan",
                  textObscure: false,
                  onlyNumbers: true,
                ),
                const SizedBox(height: defaultSize),
                ComponentsInput(
                  controller: user.controllerHeight,
                  textTitle: "Tinggi Badan",
                  textObscure: false,
                  onlyNumbers: true,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultSize * 1.25,
                  ),
                  child: ComponentsButton(
                    text: "Tambah",
                    color: colorBackground,
                    onTap: () async {
                      if (user.controllerWeight.text.isNotEmpty &&
                          user.controllerHeight.text.isNotEmpty) {
                        controllerGrowth.add(id, user);
                        user.controllerWeight.clear();
                        user.controllerHeight.clear();
                        Navigator.pop(context);
                      } else {
                        modalBottom(
                          context,
                          messageMustEntry,
                          null,
                          () {},
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: defaultSize * 1.5),
              ],
            )
          ],
        ),
      ),
    );
  }
}
