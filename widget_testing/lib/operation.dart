import 'package:flutter/material.dart';

enum Operation {
  add('Adding', Icon(Icons.add)),
  substract('Substracting', Icon(Icons.minimize)),
  multiply('Multiplication', Icon(Icons.cancel_outlined)),
  divide('Division', Icon(Icons.architecture));
  
  final String descriptionOperation;
  final Icon iconOperation;

  const Operation(this.descriptionOperation, this.iconOperation);
}