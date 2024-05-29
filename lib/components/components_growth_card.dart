// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../configs/config_components.dart';
import '../configs/config_apps.dart';

class ComponentsGrowthCard extends StatefulWidget {
  final double height;
  final double weight;
  final String? date;
  final String? age;
  final Function()? onTap;
  const ComponentsGrowthCard({
    super.key,
    required this.height,
    required this.weight,
    this.date,
    this.age,
    this.onTap,
  });

  @override
  State<ComponentsGrowthCard> createState() => _ComponentsGrowthCardState();
}

class _ComponentsGrowthCardState extends State<ComponentsGrowthCard> {
  String? role;

  @override
  void initState() {
    super.initState();
    userRole();
  }

  Future<void> userRole() async {
    try {
      final currentUserId = FirebaseAuth.instance.currentUser!.uid;

      final user = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .get();

      final data = user.data() as Map<String, dynamic>;

      setState(() {
        role = data['role'];
      });
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  String bodyMassIndex() {
    double heightInMeter = widget.height / 100;
    double bmi = widget.weight / (heightInMeter * heightInMeter);

    if (bmi < 18.5) {
      return 'Kurang Berat Badan';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Kelebihan Berat Badan';
    } else {
      return 'Obesitas';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultSize * 1.25),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConfigText(
                  configFontText: widget.date ?? "No data available",
                  configFontSize: defaultSize * 0.8,
                  configFontWeight: FontWeight.bold,
                ),
                ConfigText(
                  configFontText: widget.age ?? "No data available",
                  configFontSize: defaultSize * 0.8,
                  configFontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: defaultSize),
        GestureDetector(
          onLongPress:
              (role != null && role != 'Orang Tua') ? widget.onTap : () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultSize * 0.25),
            child: Container(
              padding: const EdgeInsets.only(
                left: defaultSize * 0.1,
                right: defaultSize * 0.1,
                top: defaultSize * 2,
                bottom: defaultSize,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                color: colorPrimary,
                boxShadow: [defaultShadow],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const ConfigText(
                              configFontText: "Berat Badan",
                              configFontColor: colorBackground,
                            ),
                            const SizedBox(height: defaultSize * 0.25),
                            ConfigText(
                              configFontText:
                                  '${widget.weight.toStringAsFixed(1)} kg',
                              configFontColor: colorBackground,
                              configFontSize: defaultSize * 1.25,
                              configFontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: defaultSize * 0.75),
                      const LineDeviderVertical(lineHeight: defaultSize * 2),
                      const SizedBox(width: defaultSize * 0.75),
                      Expanded(
                        child: Column(
                          children: [
                            const ConfigText(
                              configFontText: "Tinggi Badan",
                              configFontColor: colorBackground,
                            ),
                            const SizedBox(height: defaultSize * 0.25),
                            ConfigText(
                              configFontText:
                                  '${widget.height.toStringAsFixed(1)} cm',
                              configFontColor: colorBackground,
                              configFontSize: defaultSize * 1.25,
                              configFontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultSize * 0.75),
                  ConfigText(
                    configFontText: bodyMassIndex(),
                    configFontSize: defaultSize * 1.1,
                    configFontWeight: FontWeight.bold,
                    configFontColor: colorBackground,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultSize * 0.75),
      ],
    );
  }
}
