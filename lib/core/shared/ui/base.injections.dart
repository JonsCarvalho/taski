import 'package:get_it/get_it.dart';
import 'package:task_list/core/shared/ui/widgets/bottom_bar/custom_bottom_bar.controller.dart';

class BaseInjections {
  static void init() {
    final GetIt getIt = GetIt.instance;

    getIt.registerFactory<CustomBottomBarController>(
      () => CustomBottomBarController(),
    );
  }
}
