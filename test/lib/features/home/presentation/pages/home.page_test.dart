import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/core/shared/ui/widgets/bottom_bar/custom_bottom_bar.controller.dart';
import 'package:task_list/features/home/presentation/controllers/home.controller.dart';
import 'package:task_list/features/home/presentation/pages/home.page.dart';
import 'package:task_list/features/home/presentation/widgets/greeting.widget.dart';
import 'package:task_list/features/home/presentation/widgets/no_task_listed.widget.dart';
import 'package:task_list/features/task/domain/entities/task.entity.dart';
import 'package:task_list/features/task/presentation/widgets/task_item/task_item.widget.dart';

import 'home.page_test.mocks.dart';

@GenerateMocks([HomeController])
void main() {
  late MockHomeController mockHomeController;

  setUp(() {
    mockHomeController = MockHomeController();
    GetIt.I.registerLazySingleton<CustomBottomBarController>(
        () => CustomBottomBarController());
    GetIt.I.registerSingleton<HomeController>(mockHomeController);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget createTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  group('HomePage Tests', () {
    testWidgets('should display NoTaskListed when no tasks are available',
        (tester) async {
      when(mockHomeController.tasks).thenReturn([]);
      when(mockHomeController.tasksToDo).thenReturn(0);
      when(mockHomeController.getTasks()).thenAnswer((_) async {});

      await tester.pumpWidget(createTestableWidget(const HomePage()));

      expect(find.byType(NoTaskListed), findsOneWidget);
      expect(find.byType(Greeting), findsOneWidget);
      expect(find.byType(TaskItem), findsNothing);
    });

    testWidgets('should display TaskItem when tasks are available',
        (tester) async {
      when(mockHomeController.tasks).thenReturn([
        Task(title: 'Task 1', content: 'Content 1', completed: false),
        Task(title: 'Task 2', content: 'Content 2', completed: true),
      ]);
      when(mockHomeController.tasksToDo).thenReturn(1);
      when(mockHomeController.getTasks()).thenAnswer((_) async {});

      await tester.pumpWidget(createTestableWidget(const HomePage()));

      expect(find.byType(TaskItem), findsNWidgets(2));
      expect(find.byType(NoTaskListed), findsNothing);
      expect(find.byType(Greeting), findsOneWidget);
    });
  });
}
