import 'package:flutter/material.dart';

import '../configs/config_components.dart';
import '../configs/config_apps.dart';

class ComponentsLegend extends StatelessWidget {
  const ComponentsLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 12,
                width: 40,
                decoration: BoxDecoration(
                  color: colorSecondary,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              const SizedBox(
                width: defaultSize,
              ),
              const ConfigText(
                configFontText: "Tinggi Badan",
                configFontSize: defaultSize * 0.8,
                configFontWeight: FontWeight.w600,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 12,
                width: 40,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              const SizedBox(
                width: defaultSize,
              ),
              const ConfigText(
                configFontText: "Berat Badan",
                configFontSize: defaultSize * 0.8,
                configFontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
