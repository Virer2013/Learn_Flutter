import 'package:bloc_freezed_example/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc()..add(CounterStartEvent()),
      child: MaterialApp(
        title: 'Flutter Codegen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterPage(),
      ),
    );
  }
}
