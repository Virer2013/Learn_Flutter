import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent {event_red, event_green}

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.red;

  @override
  Color get initialState => Colors.red;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.event_red) ? Colors.red : Colors.green;
    yield _color;
  }
  
}