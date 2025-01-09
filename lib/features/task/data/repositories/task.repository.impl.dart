import 'package:hive/hive.dart';

import '../../domain/entities/task.entity.dart';
import '../../domain/repositories/task.repository.dart';
import '../dto/task.dto.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Box _taskBox;

  TaskRepositoryImpl(this._taskBox);

  @override
  Future<void> saveTask(Task task) async {
    final dto = TaskDto.fromDomain(task);

    await _taskBox.put(task.title + task.content, dto.toMap());
  }

  @override
  Future<List<Task>> getTasks({int? pageSize, int? startIndex}) async {
    List<dynamic> tasks = [];

    if (pageSize != null && startIndex != null) {
      tasks = _taskBox.values.skip(startIndex).take(pageSize).toList();
    } else {
      tasks = _taskBox.values.toList();
    }

    return tasks.map((value) {
      final map = Map<String, dynamic>.from(value as Map);
      return TaskDto.fromMap(map).toDomain();
    }).toList();
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _taskBox.delete(task.title + task.content);
  }

  @override
  Future<void> deleteAllTasks(List<Task> tasks) async {
    await _taskBox.deleteAll(
        tasks.map((element) => element.title + element.content).toList());
  }
}
