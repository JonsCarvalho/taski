import 'package:flutter_test/flutter_test.dart';
import 'package:task_list/features/task/domain/entities/task.entity.dart';

void main() {
  group('Task', () {
    test('should create a Task with given parameters', () {
      final task =
          Task(title: 'Test Title', content: 'Test Content', completed: true);

      expect(task.title, 'Test Title');
      expect(task.content, 'Test Content');
      expect(task.completed, true);
    });

    test('should create a Task with default "completed" value as false', () {
      final task = Task(title: 'Test Title', content: 'Test Content');

      expect(task.completed, false);
    });

    test('should return a new Task with updated fields using copyWith', () {
      final task =
          Task(title: 'Test Title', content: 'Test Content', completed: false);

      final updatedTask =
          task.copyWith(title: 'Updated Title', completed: true);

      expect(updatedTask.title, 'Updated Title');
      expect(updatedTask.content, 'Test Content');
      expect(updatedTask.completed, true);

      expect(task.title, 'Test Title');
      expect(task.completed, false);
    });

    test('should return the same Task if copyWith is called with no parameters',
        () {
      final task =
          Task(title: 'Test Title', content: 'Test Content', completed: false);

      final sameTask = task.copyWith();

      expect(sameTask, task);
    });

    test('should return true for equal Tasks', () {
      final task1 =
          Task(title: 'Test Title', content: 'Test Content', completed: false);
      final task2 =
          Task(title: 'Test Title', content: 'Test Content', completed: false);

      expect(task1, task2);
    });

    test('should return false for non-equal Tasks', () {
      final task1 =
          Task(title: 'Test Title', content: 'Test Content', completed: false);
      final task2 = Task(
          title: 'Different Title', content: 'Test Content', completed: false);

      expect(task1 == task2, false);
    });

    test('should return correct hashCode', () {
      final task =
          Task(title: 'Test Title', content: 'Test Content', completed: false);

      expect(
          task.hashCode,
          task.title.hashCode ^
              task.content.hashCode ^
              task.completed.hashCode);
    });

    test('should return correct string representation', () {
      final task =
          Task(title: 'Test Title', content: 'Test Content', completed: false);

      expect(
        task.toString(),
        'Task(title: Test Title, content: Test Content, completed: false)',
      );
    });
  });
}
