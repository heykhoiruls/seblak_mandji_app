import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/components_data_user.dart';
import '../components/components_icon.dart';
import '../configs/config_apps.dart';

class PageProfile extends StatelessWidget {
  const PageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(defaultSize),
              child: ComponentsIcon(),
            ),
            ComponentsDataUser(
              id: currentUserId,
            ),
          ],
        ),
      ),
    );
  }
}
