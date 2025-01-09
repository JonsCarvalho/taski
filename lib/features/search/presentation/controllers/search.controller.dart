import 'package:flutter/material.dart';
import 'package:task_list/features/task/domain/entities/task.entity.dart';
import 'package:task_list/features/task/domain/usecases/delete_task.usecase.dart';
import 'package:task_list/features/task/domain/usecases/get_task.usecase.dart';
import 'package:task_list/features/task/domain/usecases/save_task.usecase.dart';

class SearchController extends ChangeNotifier {
  final GetTasksUseCase _getTasksUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final SaveTaskUseCase _saveTaskUseCase;

  SearchController(
    this._getTasksUseCase,
    this._deleteTaskUseCase,
    this._saveTaskUseCase,
  );

  String _searchText = '';

  String get searchText => _searchText;

  void setSearchText(String value) {
    _searchText = value;
  }

  List<Task> _tasks = <Task>[];

  List<Task> get tasks => _tasks;

  Future<void> getTasks() async {
    final allTasks = await _getTasksUseCase();
    _tasks = [];

    if (searchText.isEmpty) {
      _tasks = allTasks;
    } else {
      for (var value in allTasks) {
        if (value.title.contains(searchText)) {
          _tasks.add(value);
        }
      }
    }

    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    await _deleteTaskUseCase(task);
  }

  Future<void> updateTaskValue(Task task) async {
    final newTask = task.copyWith(completed: !task.completed);

    await _saveTaskUseCase(newTask);
  }
}
