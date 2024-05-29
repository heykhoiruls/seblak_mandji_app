import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/model_controller.dart';

class ControllerGrowth {
  final streamsGrowth = FirebaseFirestore.instance.collection("growth");

  void add(String id, ModelController user) {
    streamsGrowth.doc().set({
      'id': id,
      'weight': user.controllerWeight.text,
      'height': user.controllerHeight.text,
      'timestamp': Timestamp.now(),
    });
  }
}
