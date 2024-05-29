import 'package:flutter/material.dart';

import '../configs/config_components.dart';
import '../configs/config_apps.dart';

class ComponentsList extends StatelessWidget {
  final String? name;
  final String? photo;
  final String? text;
  final Function()? onTap;
  const ComponentsList({
    super.key,
    this.name,
    this.text,
    this.onTap,
    this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: colorBlack,
            ),
            margin: const EdgeInsets.only(
              bottom: defaultSize * 0.1,
            ),
            padding: const EdgeInsets.symmetric(horizontal: defaultSize),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: colorAccent,
                    borderRadius: BorderRadius.circular(defaultRadius),
                    boxShadow: [defaultShadow],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    child: Image.network(
                      photo ?? imagePhotoBoy,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: defaultSize * 1.25),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConfigText(
                        configFontText: name ?? "No data available",
                        configFontWeight: FontWeight.bold,
                        configFontSize: defaultSize * 0.95,
                        configFontColor: colorBackground,
                      ),
                      const SizedBox(height: defaultSize * 0.25),
                      ConfigText(
                        configFontText: text ?? "No data available",
                        configFontColor: colorAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: defaultSize * 0.2,
            width: double.infinity,
            color: colorBackground,
          ),
        ],
      ),
    );
  }
}
