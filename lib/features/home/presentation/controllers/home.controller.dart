import 'package:flutter/material.dart';
import 'package:task_list/features/task/domain/entities/task.entity.dart';
import 'package:task_list/features/task/domain/usecases/get_task.usecase.dart';
import 'package:task_list/features/task/domain/usecases/save_task.usecase.dart';

class HomeController extends ChangeNotifier {
  final GetTasksUseCase _getTasksUseCase;
  final SaveTaskUseCase _saveTaskUseCase;

  HomeController(this._getTasksUseCase, this._saveTaskUseCase);

  List<Task> _tasks = <Task>[];

  List<Task> get tasks => _tasks;

  Future<void> getTasks() async {
    final allTasks = await _getTasksUseCase();
    _tasks = [];
    _tasksToDo = 0;

    for (var value in allTasks) {
      if (!value.completed) {
        _tasks.add(value);
        _tasksToDo++;
      }
    }

    notifyListeners();
  }

  int _tasksToDo = 0;

  int get tasksToDo => _tasksToDo;

  Future<void> updateTaskValue(Task task) async {
    final newTask = task.copyWith(completed: !task.completed);

    await _saveTaskUseCase(newTask);
  }
}
