import 'package:flutter/material.dart';
import 'package:mocktail_example/calculator.dart';

class Fib extends StatelessWidget {
  final Calculator calculator;

  Fib({Key? key, required this.calculator}) : super(key: key);

  String _result = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: calculator.fibonacciSequence(),
      initialData: null,
      builder: ((context, snapshot) {
        if (snapshot.data != null) {
          _result = snapshot.data.toString();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _result.isNotEmpty ? 'Fibonacci seq: $_result' : 'Calculating...',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        );
      }),
    );
  }
}