import 'package:flutter/material.dart';
import 'package:global_key_example/global_key_example_one.dart';

import 'global_key_example_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home:  const GlobalKeyExampleTwo(),
    );
  }
}