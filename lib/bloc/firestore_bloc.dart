import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_firestore/repository/firestore_repository.dart';

part 'firestore_event.dart';
part 'firestore_state.dart';

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  FirestoreBloc() : super(FirestoreInitial());
  FirestoreRepository firestoreRepository = FirestoreRepository();

  @override
  Stream<FirestoreState> mapEventToState(
    FirestoreEvent event,
  ) async* {
    if (event is AddFirestoreData) {
      firestoreRepository.addDoc();
      yield FirestoreDataAdded();
    } else if (event is GetFirestoreData) {
      Map data = await firestoreRepository.getDoc();
      yield FirestoreDataFetched(data: data);
    }
  }
}
