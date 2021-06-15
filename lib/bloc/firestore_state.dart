part of 'firestore_bloc.dart';

abstract class FirestoreState extends Equatable {
  const FirestoreState();

  @override
  List<Object> get props => [];
}

class FirestoreInitial extends FirestoreState {}

class FirestoreDataAdded extends FirestoreState {}

class FirestoreDataFetched extends FirestoreState {
  final Map data;
  FirestoreDataFetched({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
