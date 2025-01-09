import 'package:get_it/get_it.dart';
import 'package:task_list/features/create/presentation/controllers/create_task_bottom_sheet.controller.dart';

class CreateInjections {
  static void init() {
    final GetIt getIt = GetIt.instance;

    getIt.registerFactory<CreateTaskBottomSheetController>(
      () => CreateTaskBottomSheetController(getIt()),
    );
  }
}
