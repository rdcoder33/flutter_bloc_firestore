import 'package:flutter_bloc_firestore/services/firestore_services.dart';

class FirestoreRepository {
  FirestoreServices firestoreServices = FirestoreServices();

  addDoc() {
    firestoreServices.addData();
  }

  getDoc() {
    firestoreServices.getData();
  }
}
