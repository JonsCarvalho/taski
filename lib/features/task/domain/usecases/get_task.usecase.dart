import '../entities/task.entity.dart';
import '../repositories/task.repository.dart';

abstract class GetTasksUseCase {
  Future<List<Task>> call({int? pageSize, int? startIndex});
}

class GetTasksUseCaseImpl implements GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCaseImpl(this.repository);

  @override
  Future<List<Task>> call({int? pageSize, int? startIndex}) async {
    return await repository.getTasks(
        pageSize: pageSize, startIndex: startIndex);
  }
}
