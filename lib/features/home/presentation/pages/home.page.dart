import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/core/shared/ui/base.page.dart';
import 'package:task_list/features/create/presentation/widgets/create_task_bottom_sheet.widget.dart';
import 'package:task_list/features/home/presentation/controllers/home.controller.dart';
import 'package:task_list/features/home/presentation/widgets/greeting.widget.dart';
import 'package:task_list/features/home/presentation/widgets/no_task_listed.widget.dart';
import 'package:task_list/features/task/presentation/widgets/task_item/task_item.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = GetIt.I.get<HomeController>();

  @override
  void initState() {
    _homeController.getTasks();

    super.initState();
  }

  Future<void> onTapNoTaskButton() async {
    if (mounted) {
      final value = await CreateTaskBottomSheet().show(context) ?? false;

      if (value) _homeController.getTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: AnimatedBuilder(
        animation: _homeController,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 32,
              children: <Widget>[
                Greeting(tasksToDo: _homeController.tasksToDo),
                Expanded(
                  child: _homeController.tasks.isEmpty
                      ? NoTaskListed(onTap: onTapNoTaskButton)
                      : ListView.separated(
                          separatorBuilder: (_, index) => SizedBox(height: 16),
                          itemCount: _homeController.tasks.length,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            return TaskItem(
                              title: _homeController.tasks[index].title,
                              content: _homeController.tasks[index].content,
                              checked: _homeController.tasks[index].completed,
                              onChecked: () {
                                _homeController.updateTaskValue(
                                    _homeController.tasks[index]);

                                _homeController.getTasks();
                              },
                              id: '$index',
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
