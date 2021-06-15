import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firestore/bloc/firestore_bloc.dart';
import 'package:flutter_bloc_firestore/repository/firestore_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FirestoreBloc(FirestoreRepository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            BlocBuilder<FirestoreBloc, FirestoreState>(
              builder: (context, state) {
                if (state is FirestoreDataFetched) {
                  return Card(
                    child: Text('Latest Data ${state.data['test']}'),
                  );
                } else {
                  return Text('Nothing');
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<FirestoreBloc>(context)
                      .add(AddFirestoreData());
                },
                child: Text('Add Data')),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<FirestoreBloc>(context)
                      .add(GetFirestoreData());
                },
                child: Text('Get Data'))
          ],
        ));
  }
}
