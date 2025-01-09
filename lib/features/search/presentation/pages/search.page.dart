import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/core/shared/ui/base.page.dart';
import 'package:task_list/core/shared/ui/widgets/no_result_found.widget.dart';
import 'package:task_list/features/search/presentation/controllers/search.controller.dart'
    as search;
import 'package:task_list/features/search/presentation/widgets/search_input.widget.dart';
import 'package:task_list/features/task/presentation/widgets/task_item/task_item.widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final search.SearchController _searchController =
      GetIt.I.get<search.SearchController>();

  @override
  void initState() {
    _searchController.getTasks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: AnimatedBuilder(
        animation: _searchController,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 32,
              children: <Widget>[
                SearchInput(onChanged: (value) {
                  _searchController.setSearchText(value);
                  _searchController.getTasks();
                }),
                Expanded(
                  child: _searchController.tasks.isEmpty
                      ? NoResultFound()
                      : ListView.separated(
                          separatorBuilder: (_, index) => SizedBox(height: 16),
                          itemCount: _searchController.tasks.length,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            return TaskItem(
                              title: _searchController.tasks[index].title,
                              content: _searchController.tasks[index].content,
                              checked: _searchController.tasks[index].completed,
                              onChecked: () {
                                _searchController.updateTaskValue(
                                    _searchController.tasks[index]);

                                _searchController.getTasks();
                              },
                              showTrash: true,
                              onDelete: () async {
                                await _searchController
                                    .deleteTask(_searchController.tasks[index]);
                                await _searchController.getTasks();
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
