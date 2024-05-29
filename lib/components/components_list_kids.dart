// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../configs/config_apps.dart';
import '../pages/page_kids/page_kids.dart';
import 'components_transition.dart';
import 'components_empty.dart';
import 'components_list.dart';

class ComponentsListKids extends StatefulWidget {
  final String searchText;
  const ComponentsListKids({
    super.key,
    required this.searchText,
  });

  @override
  State<ComponentsListKids> createState() => _ComponentsListKidsState();
}

class _ComponentsListKidsState extends State<ComponentsListKids> {
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
      stream: controllerKid.streamKids
          .orderBy("timestamp", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        } else if (snapshot.hasData) {
          var data = snapshot.data as QuerySnapshot;
          if (data.docs.isNotEmpty) {
            return buildFilteredKids(context, data);
          } else {
            return ComponentsEmpty(
              photo: imagePageHomeEmpty,
              text: (role != null && role == "Orang Tua")
                  ? messageHomeEmptyForParent
                  : messageHomeEmptyForOthers,
            );
          }
        } else {
          return ComponentsEmpty(
            photo: imagePageHomeEmpty,
            text: (role != null && role == "Orang Tua")
                ? messageHomeEmptyForParent
                : messageHomeEmptyForOthers,
          );
        }
      },
    );
  }

  Widget buildFilteredKids(BuildContext context, QuerySnapshot snapdata) {
    final List<QueryDocumentSnapshot> filteredKids = snapdata.docs.where((kid) {
      final String name = kid['name'].toString().toLowerCase();
      return name.contains(widget.searchText.toLowerCase());
    }).toList();

    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const ComponentsEmpty(
        photo: imagePageHomeEmpty,
        text: 'User not logged in.',
      );
    }

    final currentUserId = currentUser.uid;

    return StreamBuilder(
      stream: controllerUser.streamUsers.doc(currentUserId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }

        final currentUserRole = snapshot.data?['role'];

        if (currentUserRole == "Orang Tua") {
          filteredKids.retainWhere(
            (kid) => kid['idParent'] == currentUserId,
          );
        }

        if (filteredKids.isEmpty) {
          return const ComponentsEmpty(
            photo: imagePageKidsEmpty,
            text: messageKidsEmpty,
          );
        }

        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: filteredKids.length,
            itemBuilder: (context, index) {
              var data = filteredKids[index].data() as Map<String, dynamic>;

              return Column(
                children: [
                  ComponentsList(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        transitionRight(PageKids(id: data['uid'])),
                      );
                    },
                    photo: data['photo'],
                    name: data['name'],
                    text: data['nik'],
                  ),
                  if (index == filteredKids.length - 1)
                    const SizedBox(height: defaultSize * 6)
                ],
              );
            },
          ),
        );
      },
    );
  }
}
