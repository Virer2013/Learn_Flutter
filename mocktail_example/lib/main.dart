import 'package:flutter/material.dart';
import 'package:mocktail_example/calculator.dart';
import 'package:mocktail_example/fib.dart';
import 'package:mocktail_example/operation.dart';
import 'package:mocktail_example/operation_widget.dart';
import 'package:mocktail_example/power_of_two.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Fib(calculator: calculator),
                const Divider(),
                PowerOfTwo(calculator: calculator),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.add,
                ),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.substract,
                ),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.multiply,
                ),
                const Divider(),
                OperationWidget(
                  calculator: calculator,
                  operation: Operation.divide,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
