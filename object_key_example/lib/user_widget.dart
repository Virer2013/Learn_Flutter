import 'dart:math';
import 'package:flutter/material.dart';
import 'user.dart';

class UserWidget extends StatefulWidget {
  final User user;

  const UserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = generateColor();
  }

  Color generateColor() {
    final random = Random();

    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(widget.user.name, style: TextStyle(fontSize: 20)),
          subtitle: Text(widget.user.country, style: TextStyle(fontSize: 20)),
          trailing: Text('HashCode: ${widget.user.hashCode}', style: TextStyle(fontSize: 18)),
        ),
      );
}