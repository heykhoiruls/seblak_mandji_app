import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seblak_mandji_app/components/components_transition.dart';
import 'package:seblak_mandji_app/pages/page_profile.dart';

import '../configs/config_components.dart';
import '../configs/config_apps.dart';
import '../pages/page_auth/page_auth.dart';

class ComponentsHomeHeader extends StatelessWidget {
  const ComponentsHomeHeader({super.key});

  greeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour < 10) {
      return "Hallo, Selamat pagi";
    } else if (hour < 14) {
      return "Hallo, Selamat siang";
    } else if (hour < 18) {
      return "Hallo, Selamat sore";
    } else {
      return "Hallo, Selamat malam";
    }
  }

  Widget buildHomeHeader(Map<String, dynamic> data, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          transitionLeft(
            const PageProfile(),
          ),
        );
      },
      child: Container(
        color: colorBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultSize * 2,
            vertical: defaultSize,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConfigText(
                    configFontText: data['name'] ?? '',
                    configFontSize: defaultSize,
                    configFontWeight: FontWeight.bold,
                  ),
                  const ConfigText(configFontText: "0857-5976-8369"),
                ],
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: colorBlack,
                backgroundImage: NetworkImage(data['photo'] ?? imagePhotoBoy),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: controllerUser.streamUsers.doc(currentUserId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildHomeHeader({}, context);
        }
        var data = snapshot.data!.data() as Map<String, dynamic>;
        return buildHomeHeader(data, context);
      },
    );
  }
}
