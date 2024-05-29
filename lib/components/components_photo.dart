import 'package:flutter/material.dart';

import '../components/components_decision.dart';
import '../configs/config_apps.dart';

class ComponentsPhoto extends StatelessWidget {
  final Function()? onTapRight;
  final Function()? onTapLeft;
  final Image? photo;
  final bool isEdit;
  const ComponentsPhoto({
    super.key,
    this.onTapRight,
    this.onTapLeft,
    this.photo,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDetail = false;
    return Column(
      children: [
        const SizedBox(height: defaultSize * 0.75),
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius * 2),
            border: Border.all(
              color: colorAccent,
              width: 2.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadius * 2),
            child: photo,
          ),
        ),
        isDetail || isEdit
            ? const SizedBox(height: defaultSize * 1.75)
            : const SizedBox.shrink(),
        isDetail || isEdit
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSize),
                child: ComponentsDecision(
                  textLeft: "Unggah",
                  textRight: "Pilih",
                  onTapLeft: onTapLeft,
                  onTapRight: onTapRight,
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(height: defaultSize),
      ],
    );
  }
}
