part of 'firestore_bloc.dart';

abstract class FirestoreEvent extends Equatable {
  const FirestoreEvent();

  @override
  List<Object> get props => [];
}

class AddFirestoreData extends FirestoreEvent{

}

class GetFirestoreData extends FirestoreEvent{}