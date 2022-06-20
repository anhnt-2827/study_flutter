import 'package:flutter/material.dart';

class UI with ChangeNotifier {
  double _fontSize = 0.5;

  set fontSize(newValue) {
    _fontSize = newValue;
    notifyListeners();
  }

  double get fontSize => _fontSize * 30;
  double get sliderFontSize => _fontSize;

  // Color base
  final Color _transparent = Colors.transparent;
  final Color _black = Colors.black87;
  final Color _white = Colors.white70;
  final Color _grey = Colors.grey;

  // Get color
  Color get colorTransparent => _transparent;
  Color get colorBlack => _black;
  Color get colorWhite => _white;
  Color get colorGrey => _grey;
}
