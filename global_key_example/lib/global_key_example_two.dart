import 'dart:developer';

import 'package:flutter/material.dart';

import 'helper.dart';

class GlobalKeyExampleTwo extends StatefulWidget {
  const GlobalKeyExampleTwo({Key? key}) : super(key: key);

  @override
  _GlobalKeyExampleTwoState createState() => _GlobalKeyExampleTwoState();
}

class _GlobalKeyExampleTwoState extends State<GlobalKeyExampleTwo> {
  final formKey = GlobalKey<FormState>();
  
  bool isSignedIn = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('GlobalKey Example 2'),
          centerTitle: true,
        ),
        body: isSignedIn ? buildHome() : buildLogin(),
      );

  Widget buildLogin() => Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && !value.contains('@')
                  ? 'Not a Valid Email!'
                  : null,
                onSaved: (value) => email = value!,
            ),
            const SizedBox(height: 24),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.length < 3
                  ? 'Password needs 3 characters.'
                  : null,
              onSaved: (value) => password = value!,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700],
                minimumSize: const Size.fromHeight(40),
              ),
              child: const FittedBox(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              onPressed: submit,
            ),
          ],
        ),
      );

  Widget buildHome() => Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextRowWidget(title: 'Email', value: email),
            TextRowWidget(title: 'Password', value: password),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700],
                minimumSize: const Size.fromHeight(40),
              ),
              child: const FittedBox(
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              onPressed: () => setState(() => isSignedIn = false),
            ),
          ],
        ),
      );

  void submit() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      log('Form valid: $email');

      setState(() => isSignedIn = true);
    }
  }
}
