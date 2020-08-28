import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greeting_application/scenes/greeting/bloc/services/color_generator.dart';
import 'package:greeting_application/scenes/greeting/model/color_pair.dart';

class GreetingBloc {
  final ColorPairGeneratorService _backgroundColorGeneratorService;
  final StreamController<Color> _backgroundColorController = StreamController.broadcast();
  final StreamController<Color> _textColorController = StreamController.broadcast();

  GreetingBloc(this._backgroundColorGeneratorService);

  Stream<Color> get colorStream => _backgroundColorController.stream;

  Stream<Color> get textColorStream => _textColorController.stream;

  void updateColor() {
    ColorsPair _colorsPair =
        _backgroundColorGeneratorService.generateColorsPair();
     _backgroundColorController.add(_colorsPair.backgroundColor);
     _textColorController.add(_colorsPair.textColor);
  }
}
