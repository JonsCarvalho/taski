import 'package:get_it/get_it.dart';

import 'presentation/controllers/done.controller.dart';

class DoneInjections {
  static void init() {
    final GetIt getIt = GetIt.instance;

    getIt.registerFactory<DoneController>(
      () => DoneController(getIt(), getIt(), getIt()),
    );
  }
}
