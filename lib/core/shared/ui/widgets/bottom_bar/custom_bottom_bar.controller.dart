import 'package:flutter/material.dart';

class CustomBottomBarController extends ChangeNotifier {
  CustomBottomBarController({
    int? selectedIndex,
  })  : _selectedIndex = selectedIndex ?? 0,
        _lastIndex = selectedIndex ?? 0;

  int _selectedIndex;

  int get selectedIndex => _selectedIndex;
  void setSelectedIndex(int value) {
    _lastIndex = _selectedIndex;
    _selectedIndex = value;
    notifyListeners();
  }

  int _lastIndex;

  int get lastIndex => _lastIndex;
}
