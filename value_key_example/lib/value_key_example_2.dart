import 'package:flutter/material.dart';

class ValueKeyExample2 extends StatefulWidget {
  const ValueKeyExample2({Key? key}) : super(key: key);

  @override
  State<ValueKeyExample2> createState() => _ValueKeyExample2State();
}

class _ValueKeyExample2State extends State<ValueKeyExample2> {
  bool showEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueKey Example 2'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showEmail)
               const TextField(
                key: ValueKey(MyObject('email')),
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  icon:  Icon(Icons.email),
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
             const TextField(
              key: ValueKey(MyObject('username')),
              decoration:  InputDecoration(
                border: OutlineInputBorder(),
                icon:  Icon(Icons.people),
                labelText: 'Username',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.grey,
          textStyle: const TextStyle(fontSize: 20),
        ),
        icon: const Icon(Icons.visibility_off),
        label: const Text('Remove Email'),
        onPressed: () => setState(() => showEmail = false),
      ),
    );
  }
}

class MyObject {
  final String keyString;

  const MyObject(this.keyString);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyObject &&
          runtimeType == other.runtimeType &&
          keyString == other.keyString;

  @override
  int get hashCode => keyString.hashCode;
  
}
