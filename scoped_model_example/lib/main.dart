import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScopedModel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ScopedModel Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScopedModel Widget'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ScopedModel<MyModelState>(
            model: MyModelState(),
            child: _AppRootWidget(),
          ),
        ],
      ),
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(Root Widget)', style: Theme.of(context).textTheme.display1),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _Counter(),
              _Counter(),
            ],
          ),
        ],
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModelState>(
      rebuildOnChange: false,
      builder: (context, child, model) => Card(
        margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0),
        color: Colors.yellowAccent,
        child: Column(
          children: <Widget>[
            Text('(Child Widget)'),
            Text('${model.counterValue}', style: Theme.of(context).textTheme.display1),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.red,
                  onPressed: () => model._decrementCounter(),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.green,
                  onPressed: () => model._incrementCounter(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyModelState extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void _decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
