import '../configs/config_components.dart';
import 'package:line_icons/line_icon.dart';
import 'package:flutter/material.dart';

import '../configs/config_apps.dart';

class ComponentsTextBox extends StatelessWidget {
  final String? text;
  final String? textTitle;
  final int? index;
  final bool? showIcon;

  final Function()? onTap;
  const ComponentsTextBox({
    super.key,
    this.text,
    this.textTitle,
    this.index,
    this.onTap,
    this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultSize),
      child: Column(
        children: [
          index == 0
              ? const SizedBox(
                  height: defaultSize * 1.5,
                )
              : const SizedBox.shrink(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultSize * 0.7),
              child: ConfigText(
                configFontText: textTitle ?? "Title Name",
                configFontSize: defaultSize * 0.85,
                configFontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: defaultSize),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorBlack,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: defaultSize,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultSize * 1.5,
                    vertical: defaultSize * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConfigText(
                        configFontText: text ?? "No data available",
                        configFontSize: defaultSize,
                        configFontColor: colorAccent,
                      ),
                      onTap != null
                          ? Container(
                              height: defaultSize * 2.5,
                              width: defaultSize * 2.5,
                              color: colorBlack,
                            )
                          : Container(
                              height: defaultSize * 2.5,
                              width: defaultSize * 2.5,
                              color: colorBlack,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultSize * 1.2),
        ],
      ),
    );
  }
}
