import 'package:get_it/get_it.dart';

import 'presentation/controllers/home.controller.dart';

class HomeInjections {
  static void init() {
    final GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<HomeController>(
      () => HomeController(getIt(), getIt()),
    );
  }
}
