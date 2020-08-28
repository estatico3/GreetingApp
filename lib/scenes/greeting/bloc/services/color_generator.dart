import 'dart:math';

import 'package:flutter/material.dart';
import 'package:greeting_application/scenes/greeting/model/color_pair.dart';

abstract class ColorPairGeneratorService {
  ColorsPair generateColorsPair();
}

class ColorPairGenerator implements ColorPairGeneratorService {
  final Random _random = Random(1231312414);

  @override
  ColorsPair generateColorsPair() {
    final red = _getRandomIntInRange();
    final green = _getRandomIntInRange();
    final blue = _getRandomIntInRange();
    final backgroundColor = Color.fromRGBO(red, green, blue, 1.0);
    final textColor = _getTextColor(red, green, blue);
    return ColorsPair(backgroundColor: backgroundColor, textColor: textColor);
  }

  // Not the best algorithm :D
  Color _getTextColor(int r, int g, int b) {
    return r + g + b > (255).floor() ? Colors.black : Colors.white;
  }

  // As random generates numbers in range from 1 to "max", without subtracting
  // 1 we would not be able to get 0
  int _getRandomIntInRange() {
    return _random.nextInt(256) - 1;
  }
}
