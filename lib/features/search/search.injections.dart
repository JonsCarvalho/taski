import 'package:get_it/get_it.dart';

import 'presentation/controllers/search.controller.dart';

class SearchInjections {
  static void init() {
    final GetIt getIt = GetIt.instance;

    getIt.registerFactory<SearchController>(
      () => SearchController(getIt(), getIt(), getIt()),
    );
  }
}
