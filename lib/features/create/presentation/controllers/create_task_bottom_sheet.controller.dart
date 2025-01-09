import 'package:flutter/material.dart';
import 'package:task_list/features/task/domain/entities/task.entity.dart';
import 'package:task_list/features/task/domain/usecases/save_task.usecase.dart';

class CreateTaskBottomSheetController extends ChangeNotifier {
  final SaveTaskUseCase _createTaskUseCase;

  CreateTaskBottomSheetController(this._createTaskUseCase);

  bool _completed = false;

  bool get completed => _completed;

  void setCompleted(bool? value) {
    _completed = value ?? false;
    notifyListeners();
  }

  String _title = '';

  String get title => _title;

  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  String _content = '';

  String get content => _content;

  void setContent(String value) {
    _content = value;
    notifyListeners();
  }

  void onCreateTask() async {
    await _createTaskUseCase(
      Task(
        title: title,
        content: content,
        completed: completed,
      ),
    );
  }
}
