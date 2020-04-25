import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SharedPrefereceExample(),
    );
  }
}

class SharedPrefereceExample extends StatefulWidget {
  @override
  _SharedPrefereceExampleState createState() => _SharedPrefereceExampleState();
}

class _SharedPrefereceExampleState extends State<SharedPrefereceExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
      ),
      body: Column(
        children: <Widget>[
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(children: <Widget>[
                Text('Number Preference'),
                Text('0'),
                RaisedButton(
                  child: Text('Increment'),
                  onPressed: () {},
                ),
              ]),
              TableRow(children: <Widget>[
                Text('Boolean Preference'),
                Text('FALSE'),
                RaisedButton(
                  child: Text('Toogle'),
                  onPressed: () {},
                ),
              ]),
            ],
          ),
          RaisedButton(
            child: Text('Reset Data'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
