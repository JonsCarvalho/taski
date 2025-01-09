import '../entities/task.entity.dart';

abstract class TaskRepository {
  Future<void> saveTask(Task task);

  Future<List<Task>> getTasks({int? pageSize, int? startIndex});

  Future<void> deleteTask(Task task);

  Future<void> deleteAllTasks(List<Task> tasks);
}
