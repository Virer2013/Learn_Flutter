import 'package:flutter/material.dart';

class ValueKeyExample3 extends StatefulWidget {
  const ValueKeyExample3({Key? key}) : super(key: key);

  @override
  _ValueKeyExample3State createState() => _ValueKeyExample3State();
}

class _ValueKeyExample3State extends State<ValueKeyExample3> {
  // Generate dummy data for the list view
  final List<String> _elements =
      List.generate(100, (index) => 'Element ${index.toString()}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueKey Example 3'),
        centerTitle: true,
      ),
      body: ReorderableListView.builder(
          itemCount: _elements.length,
          itemBuilder: (context, index) {
            return Card(
              key: ValueKey(_elements[index]),
              color: Colors.grey,
              elevation: 1,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(25),
                title: Text(
                  _elements[index],
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: const Icon(Icons.drag_handle),
                subtitle: const TextField(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            );
          },
          // The reorder function
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              final element = _elements.removeAt(oldIndex);
              _elements.insert(newIndex, element);
            });
          }),
    );
  }
}
