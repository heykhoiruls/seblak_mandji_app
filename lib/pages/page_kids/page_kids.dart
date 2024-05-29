// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/components_floating.dart';

import '../../components/components_header.dart';

import '../../components/components_list.dart';
import '../../configs/config_apps.dart';

class PageKids extends StatefulWidget {
  final String id;
  const PageKids({
    super.key,
    required this.id,
  });

  @override
  State<PageKids> createState() => _PageKidsState();
}

class _PageKidsState extends State<PageKids> {
  bool isClicked = false;
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controllerKid.streamKids.doc(widget.id).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.data() == null) {
          return const Scaffold(
            backgroundColor: colorBackground,
            body: SizedBox.shrink(),
          );
        }
        if (snapshot.hasData) {
          var data = snapshot.data!.data() as Map<String, dynamic>;

          return Scaffold(
            backgroundColor: colorBackground,
            body: SafeArea(
              child: Column(
                children: [
                  ComponentsHeader(
                    text: "Detail Menu",
                    id: widget.id,
                    isKidPage: true,
                  ),
                  const SizedBox(height: defaultSize * 0.5),
                  ComponentsList(
                    photo: data['photo'],
                    name: data['name'],
                    text: data['nik'],
                  ),
                  // const SizedBox(height: defaultSize * 0.5),
                  // ComponentsChoice(
                  //   textLeft: "Pertumbuhan",
                  //   textRight: "Imunisasi",
                  //   onValueChanged: (value) {
                  //     setState(() {
                  //       isClicked = value;
                  //     });
                  //   },
                  // ),
                  // const SizedBox(height: defaultSize * 1.5),
                  // isClicked
                  //     ? ComponentsHistoryImmunization(id: data['uid'])
                  //     : ComponentsHistoryGrowth(id: widget.id),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
