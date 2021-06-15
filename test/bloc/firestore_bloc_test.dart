import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_firestore/bloc/firestore_bloc.dart';
import 'package:flutter_bloc_firestore/repository/firestore_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  late FirestoreRepository fireRepository;
  late FirestoreBloc fireBloc;
  await Firebase.initializeApp();

  setUp(() {
    fireRepository = FirestoreRepository();
    fireBloc = FirestoreBloc();
  });

  tearDown(() {
    fireBloc.close();
  });

  blocTest<FirestoreBloc, FirestoreState>('Firestore Bloc Initial State Tests',
      build: () => fireBloc, expect: () => FirestoreInitial());
}
