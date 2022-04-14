import 'package:flutter/material.dart';

import 'helper.dart';

final counterKey = GlobalKey<_CounterWidgetState>();

class GlobalKeyExampleOne extends StatelessWidget {
  const GlobalKeyExampleOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GlobalKey Example 1'),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterWidget(
              key: counterKey,
            ),
            ElevatedButton(
              onPressed: () {
                final counter = counterKey.currentState?.counter;

                counterKey.currentState?.add();
                final newCounter = counterKey.currentState?.counter;

                Utils.showSnackBar(context,
                    text: 'Counter: $counter -> $newCounter');
              },
              child: const Text('Add'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int counter;

  @override
  void initState() {
    counter = 0;
    super.initState();
  }

  void add() => setState(() => counter += 10);

  @override
  Widget build(BuildContext context) {
    return Text('$counter', style: const TextStyle(fontSize: 32));
  }
}
