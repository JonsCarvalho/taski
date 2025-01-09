import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/core/shared/ui/base.page.dart';
import 'package:task_list/features/done/presentation/controllers/done.controller.dart';
import 'package:task_list/features/done/presentation/widgets/done_header.widget.dart';
import 'package:task_list/core/shared/ui/widgets/no_result_found.widget.dart';
import 'package:task_list/features/task/presentation/widgets/task_item/task_item.widget.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  final DoneController _doneController = GetIt.I.get<DoneController>();

  @override
  void initState() {
    _doneController.getTasks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: AnimatedBuilder(
        animation: _doneController,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 32,
              children: <Widget>[
                DoneHeader(
                  onDelete: () async {
                    await _doneController.deleteAllTasks(_doneController.tasks);
                    await _doneController.getTasks();
                  },
                ),
                Expanded(
                  child: _doneController.tasks.isEmpty
                      ? NoResultFound()
                      : ListView.separated(
                          separatorBuilder: (_, index) => SizedBox(height: 16),
                          itemCount: _doneController.tasks.length,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            return TaskItem(
                              title: _doneController.tasks[index].title,
                              content: _doneController.tasks[index].content,
                              checked: _doneController.tasks[index].completed,
                              onDelete: () async {
                                await _doneController
                                    .deleteTask(_doneController.tasks[index]);
                                await _doneController.getTasks();
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
