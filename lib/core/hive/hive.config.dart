import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  static Future<void> injection() async {
    await init();

    final taskBox = await Hive.openBox('tasks');

    GetIt.I.registerLazySingleton<Box>(() => taskBox);
  }
}
