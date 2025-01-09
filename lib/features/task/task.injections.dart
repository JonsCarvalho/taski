import 'package:get_it/get_it.dart';

import 'data/repositories/task.repository.impl.dart';
import 'domain/repositories/task.repository.dart';
import 'domain/usecases/save_task.usecase.dart';
import 'domain/usecases/delete_all_tasks.usecase.dart';
import 'domain/usecases/delete_task.usecase.dart';
import 'domain/usecases/get_task.usecase.dart';

class TaskInjections {
  static void init() {
    final GetIt getIt = GetIt.instance;

    getIt.registerFactory<TaskRepository>(
      () => TaskRepositoryImpl(getIt()),
    );

    getIt.registerFactory<SaveTaskUseCase>(
      () => SaveTaskUseCaseImpl(getIt()),
    );

    getIt.registerFactory<GetTasksUseCase>(
      () => GetTasksUseCaseImpl(getIt()),
    );

    getIt.registerFactory<DeleteTaskUseCase>(
      () => DeleteTaskUseCaseImpl(getIt()),
    );

    getIt.registerFactory<DeleteAllTasksUseCase>(
      () => DeleteAllTasksUseCaseImpl(getIt()),
    );
  }
}
