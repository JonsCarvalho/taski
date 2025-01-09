import '../entities/task.entity.dart';
import '../repositories/task.repository.dart';

abstract class SaveTaskUseCase {
  Future<void> call(Task task);
}

class SaveTaskUseCaseImpl implements SaveTaskUseCase {
  final TaskRepository repository;

  SaveTaskUseCaseImpl(this.repository);

  @override
  Future<void> call(Task task) async {
    await repository.saveTask(task);
  }
}
