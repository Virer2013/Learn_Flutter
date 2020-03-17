import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var rawDate = DateTime(1485789600);
    var dateFormat = DateFormat('EEEE');
    print(dateFormat.format(rawDate));

    return MaterialApp(
      title: 'Dependencies',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dependencies & Package'),
          centerTitle: true,
        ),
      ),
    );
  }
}
