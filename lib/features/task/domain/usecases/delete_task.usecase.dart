import '../entities/task.entity.dart';
import '../repositories/task.repository.dart';

abstract class DeleteTaskUseCase {
  Future<void> call(Task task);
}

class DeleteTaskUseCaseImpl implements DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCaseImpl(this.repository);

  @override
  Future<void> call(Task task) async {
    await repository.deleteTask(task);
  }
}
