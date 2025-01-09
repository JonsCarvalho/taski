import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_list/features/home/presentation/widgets/greeting.widget.dart';

void main() {
  testWidgets('Greeting widget displays correct text',
      (WidgetTester tester) async {
    const int tasksToDo = 5;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Greeting(tasksToDo: tasksToDo),
        ),
      ),
    );

    expect(find.text('You’ve got 5 tasks to do.'), findsOneWidget);
  });
}
