import 'package:flutter/material.dart';

class TaskItemController extends ChangeNotifier {
  TaskItemController({
    bool? expanded,
  }) : _expanded = expanded ?? false;

  bool _expanded;

  bool get expanded => _expanded;
  void setExpanded(bool value) {
    _expanded = value;
    notifyListeners();
  }
}
