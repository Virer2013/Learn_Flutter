import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: textFieldController,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            child: const Text(
              'Send text back',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              String textToSendBack = textFieldController.text;
              Navigator.pop(context, textToSendBack);
            },
          )
        ],
      ),
    );
  }
}
