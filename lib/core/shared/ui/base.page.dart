import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/core/shared/ui/widgets/bottom_bar/custom_bottom_bar.controller.dart';
import 'package:task_list/core/shared/ui/widgets/bottom_bar/custom_bottom_bar.widget.dart';
import 'package:task_list/core/shared/ui/widgets/custom_app_bar.widget.dart';
import 'package:task_list/features/create/presentation/widgets/create_task_bottom_sheet.widget.dart';
import 'package:task_list/features/done/presentation/pages/done.page.dart';
import 'package:task_list/features/home/presentation/controllers/home.controller.dart';
import 'package:task_list/features/home/presentation/pages/home.page.dart';
import 'package:task_list/features/search/presentation/pages/search.page.dart';

class BasePage extends StatelessWidget {
  final Widget? child;

  const BasePage({
    super.key,
    required this.child,
  });

  static final bottomBarController = GetIt.I.get<CustomBottomBarController>();

  Future<void> _onCreateTask(context) async {
    final value = await CreateTaskBottomSheet().show(context) ?? false;

    final HomeController homeController = GetIt.I.get<HomeController>();

    if (value) await homeController.getTasks();

    bottomBarController.setSelectedIndex(bottomBarController.lastIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 65),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 22,
                      left: 22,
                      right: 22,
                    ),
                    child: CustomAppBar(),
                  ),
                  Expanded(child: child ?? SizedBox.shrink()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomBottomBar(
                controller: bottomBarController,
                items: [
                  CustomBottomBarItemModel(
                    icon: Icons.list_rounded,
                    label: 'Todo',
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  CustomBottomBarItemModel(
                    icon: Icons.add_box_outlined,
                    label: 'Create',
                    onTap: () => _onCreateTask(context),
                  ),
                  CustomBottomBarItemModel(
                    icon: Icons.search,
                    label: 'Search',
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const SearchPage(),
                        ),
                      );
                    },
                  ),
                  CustomBottomBarItemModel(
                    icon: Icons.check_box_outlined,
                    label: 'Done',
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const DonePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
