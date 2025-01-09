import 'package:flutter/material.dart';
import 'package:task_list/features/task/domain/entities/task.entity.dart';
import 'package:task_list/features/task/domain/usecases/delete_all_tasks.usecase.dart';
import 'package:task_list/features/task/domain/usecases/delete_task.usecase.dart';
import 'package:task_list/features/task/domain/usecases/get_task.usecase.dart';

class DoneController extends ChangeNotifier {
  final GetTasksUseCase _getTasksUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final DeleteAllTasksUseCase _deleteAllTasksUseCase;

  DoneController(
    this._getTasksUseCase,
    this._deleteTaskUseCase,
    this._deleteAllTasksUseCase,
  );

  List<Task> _tasks = <Task>[];

  List<Task> get tasks => _tasks;

  Future<void> getTasks() async {
    final allTasks = await _getTasksUseCase();
    _tasks = [];

    for (var value in allTasks) {
      if (value.completed) {
        _tasks.add(value);
      }
    }

    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    await _deleteTaskUseCase(task);
  }

  Future<void> deleteAllTasks(List<Task> tasks) async {
    await _deleteAllTasksUseCase(tasks);
  }
}
