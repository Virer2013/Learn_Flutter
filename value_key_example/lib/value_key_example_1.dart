import 'dart:developer';

import 'package:flutter/material.dart';

class ValueKeyExample1 extends StatefulWidget {
  const ValueKeyExample1({Key? key}) : super(key: key);

  @override
  _ValueKeyExample1State createState() => _ValueKeyExample1State();
}

class _ValueKeyExample1State extends State<ValueKeyExample1> {
  late int counter;

  @override
  void initState() {
    log('# ValueKeyExample1 init state');
    counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('ValueKeyExample1 - call method build(context)');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueKey Example 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScaleAnimated(
              duration: const Duration(seconds: 2),
              child: Text("Виджет без ключа: $counter",
                  style: const TextStyle(fontSize: 30)),
            ),
            ScaleAnimated(
              key: ValueKey(counter),
              duration: const Duration(seconds: 2),
              child: Text("Виджет с ключом: $counter",
                  style: const TextStyle(fontSize: 30)),
            ),
            ElevatedButton(
              child: const Text("Нажми меня"),
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Colors.grey,
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScaleAnimated extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ScaleAnimated({Key? key, required this.child, required this.duration})
      : super(key: key);

  @override
  _ScaleAnimatedState createState() => _ScaleAnimatedState();
}

class _ScaleAnimatedState extends State<ScaleAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    log('# ScaleAnimated init state');
    _controller = AnimationController(
        vsync: this,
        duration: widget.duration,
        upperBound: 1.0,
        lowerBound: 0.0);
    _controller.forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
