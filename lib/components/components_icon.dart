import 'package:line_icons/line_icon.dart';
import 'package:flutter/material.dart';

import '../configs/config_apps.dart';

class ComponentsIcon extends StatelessWidget {
  final LineIcon? icon;
  final Function()? onTap;

  const ComponentsIcon({
    super.key,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            Container(
              height: defaultSize * 3,
              width: defaultSize * 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: icon ??
                  const LineIcon.arrowLeft(
                    color: colorBlack,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
