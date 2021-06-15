import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addData() async {
    firestore.collection('documents').add({'test': Random().nextInt(10000)});
  }

  Future<Map<String, dynamic>> getData() async {
    QuerySnapshot<Map<String, dynamic>> data =
        await firestore.collection('documents').get();
    return data.docs[0].data();
  }
}
