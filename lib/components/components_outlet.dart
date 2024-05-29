import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:seblak_mandji_app/configs/config_apps.dart';
import 'package:seblak_mandji_app/configs/config_components.dart';

class ComponentsOutlet extends StatelessWidget {
  const ComponentsOutlet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultSize * 2,
              vertical: defaultSize,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorBackground,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: const Padding(
                padding: EdgeInsets.all(defaultSize),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        LineIcon.mapPin(
                          color: colorBlack,
                        ),
                        SizedBox(width: defaultSize),
                        ConfigText(
                          configFontText: "Seblak Mandji Cifest",
                          configFontSize: defaultSize,
                          configFontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    LineIcon.angleDown(
                      color: colorBlack,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
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
        ],
      ),
    );
  }
}
