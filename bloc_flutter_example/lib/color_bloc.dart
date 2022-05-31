import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ColorEvent {}

class RedColorEvent extends ColorEvent {}
class GreenColorEvent extends ColorEvent {}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.red) {
    on<RedColorEvent>((event, emit) => emit(Colors.red));
    on<GreenColorEvent>((event, emit) => emit(Colors.green));
  }
  
}