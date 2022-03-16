
import 'package:flutter/material.dart';
import 'package:value_key_example/value_key_example_1.dart';
import 'package:value_key_example/value_key_example_2.dart';
import 'package:value_key_example/value_key_example_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const ValueKeyExample3(),
    );
  }
}
