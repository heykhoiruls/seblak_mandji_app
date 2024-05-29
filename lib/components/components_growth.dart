import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/components_growth_card.dart';
import '../configs/config_components.dart';
import 'components_modal_bottom.dart';
import 'components_growth_chart.dart';
import '../configs/config_apps.dart';
import 'components_legend.dart';
import 'components_empty.dart';

class ComponentsHistoryGrowth extends StatefulWidget {
  final String id;
  const ComponentsHistoryGrowth({
    super.key,
    required this.id,
  });

  @override
  State<ComponentsHistoryGrowth> createState() =>
      _ComponentsHistoryGrowthState();
}

class _ComponentsHistoryGrowthState extends State<ComponentsHistoryGrowth> {
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

  Future<Map<String, dynamic>> getKidsData(String id) async {
    try {
      CollectionReference kidsCollection = controllerKid.streamKids;

      QuerySnapshot kidsQuerySnapshot = await kidsCollection
          .where(
            'uid',
            isEqualTo: id,
          )
          .get();

      Map<String, dynamic> kidsData = {};
      for (var doc in kidsQuerySnapshot.docs) {
        kidsData[doc.id] = doc.data();
      }

      return kidsData;
    } catch (e) {
      return {};
    }
  }

  Widget buildGrowth(
    BuildContext context,
    QuerySnapshot snapdata,
    Map<String, dynamic> kidsData,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultSize),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: colorAccent,
          ),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapdata.size,
            itemBuilder: (context, index) {
              var data = snapdata.docs[index].data() as Map<String, dynamic>;

              var formattedDate = DateFormat('EEE, dd MMMM yyyy').format(
                data['timestamp'].toDate(),
              );

              DateTime birthDate = kidsData[widget.id]['birthDate'].toDate();

              int calAgeInMonths(DateTime birthDate) {
                final currentDate = data['timestamp'].toDate();
                final age = currentDate.difference(birthDate);
                final ageInMonths = age.inDays ~/ 30;
                return ageInMonths;
              }

              int ageInMonths = calAgeInMonths(birthDate);

              List<double> dataHeight = [];
              List<double> dataWeight = [];

              for (var doc in snapdata.docs.reversed) {
                var data = doc.data() as Map<String, dynamic>;
                if (data.containsKey('height')) {
                  dataHeight.add(double.parse(data['height']));
                }
                if (data.containsKey('weight')) {
                  dataWeight.add(double.parse(data['weight']));
                }
              }

              return Padding(
                padding: const EdgeInsets.all(defaultSize * 0.5),
                child: Column(
                  children: [
                    if (index == 0)
                      Column(
                        children: [
                          const SizedBox(height: defaultSize),
                          const ConfigText(
                            configFontText: "Riwayat Pertumbuhan",
                            configFontSize: defaultSize,
                            configFontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: defaultSize * 1.5),
                          ComponentsGrowthChart(
                            id: widget.id,
                            height: dataHeight,
                            weight: dataWeight,
                            ageInMonths: ageInMonths,
                          ),
                          const SizedBox(height: defaultSize * 1.5),
                          const ComponentsLegend(),
                          const SizedBox(height: defaultSize * 1.5),
                        ],
                      ),
                    ComponentsGrowthCard(
                      height: double.parse(data['height']),
                      weight: double.parse(data['weight']),
                      date: formattedDate,
                      age: "$ageInMonths Bulan",
                      onTap: () {
                        modalBottom(
                          context,
                          messageDeleteRecords,
                          '90',
                          () {
                            controllerGrowth.streamsGrowth
                                .doc(snapdata.docs[index].id)
                                .delete();
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                    if (index == snapdata.size - 1)
                      const SizedBox(height: defaultSize * 6)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controllerGrowth.streamsGrowth
          .where("id", isEqualTo: widget.id)
          .orderBy("timestamp", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        } else if (snapshot.hasData) {
          var data = snapshot.data as QuerySnapshot;
          if (data.docs.isNotEmpty) {
            return FutureBuilder(
              future: getKidsData(widget.id),
              builder:
                  (context, AsyncSnapshot<Map<String, dynamic>> kidsSnapshot) {
                if (kidsSnapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox.shrink();
                } else if (kidsSnapshot.hasData) {
                  return buildGrowth(context, data, kidsSnapshot.data!);
                } else {
                  return const ComponentsEmpty(
                    photo: imagePageKidsEmpty,
                    text: messageDefault,
                  );
                }
              },
            );
          } else {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSize),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    color: colorAccent,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      ComponentsEmpty(
                        photo: imagePageKidsEmpty,
                        text: (role != "Orang Tua")
                            ? messageKidsDataEmptyForOthers
                            : messageKidsDataEmptyForParent,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        } else {
          return Container(
            color: colorPrimary,
            child: ComponentsEmpty(
              photo: imagePageKidsEmpty,
              text: (role != "Orang Tua")
                  ? messageKidsDataEmptyForOthers
                  : messageKidsDataEmptyForParent,
            ),
          );
        }
      },
    );
  }
}
