import 'package:task_list/core/hive/hive.config.dart';
import 'package:task_list/core/shared/ui/base.injections.dart';
import 'package:task_list/features/create/create.injections.dart';
import 'package:task_list/features/done/done.injections.dart';
import 'package:task_list/features/home/home.injections.dart';
import 'package:task_list/features/search/search.injections.dart';
import 'package:task_list/features/task/task.injections.dart';

class AppInjections {
  static Future<void> init() async {
    await HiveConfig.injection();
    TaskInjections.init();
    CreateInjections.init();
    BaseInjections.init();
    HomeInjections.init();
    SearchInjections.init();
    DoneInjections.init();
  }
}
