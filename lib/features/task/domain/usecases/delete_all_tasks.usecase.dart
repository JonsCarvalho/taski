import '../entities/task.entity.dart';
import '../repositories/task.repository.dart';

abstract class DeleteAllTasksUseCase {
  Future<void> call(List<Task> tasks);
}

class DeleteAllTasksUseCaseImpl implements DeleteAllTasksUseCase {
  final TaskRepository repository;

  DeleteAllTasksUseCaseImpl(this.repository);

  @override
  Future<void> call(List<Task> tasks) async {
    await repository.deleteAllTasks(tasks);
  }
}
