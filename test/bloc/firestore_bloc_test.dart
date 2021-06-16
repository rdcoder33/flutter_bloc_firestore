import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_firestore/bloc/firestore_bloc.dart';
import 'package:flutter_bloc_firestore/repository/firestore_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirestoreRepository extends Mock implements FirestoreRepository {}

void main() {
  late FirestoreRepository fireRepository;
  late FirestoreBloc fireBloc;

  setUp(() {
    fireRepository = MockFirestoreRepository();
    fireBloc = FirestoreBloc(fireRepository);
  });

  tearDown(() {
    fireBloc.close();
  });

  test('initial state is correct', () {
    expect(fireBloc.state, equals(FirestoreInitial()));
  });
}
