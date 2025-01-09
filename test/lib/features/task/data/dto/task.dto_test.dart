import 'package:flutter_test/flutter_test.dart';
import 'package:task_list/features/task/data/dto/task.dto.dart';
import 'package:task_list/features/task/domain/entities/task.entity.dart';

void main() {
  group('TaskDto', () {
    test('should create TaskDto from domain Task', () {
      final task =
          Task(title: 'Test Title', content: 'Test Content', completed: true);
      final taskDto = TaskDto.fromDomain(task);

      expect(taskDto.task, task);
    });

    test('should convert TaskDto to domain Task', () {
      final task =
          Task(title: 'Test Title', content: 'Test Content', completed: true);
      final taskDto = TaskDto(task: task);

      final domainTask = taskDto.toDomain();

      expect(domainTask, task);
    });

    test('should create TaskDto from map', () {
      final map = {
        'title': 'Test Title',
        'content': 'Test Content',
        'completed': true,
      };

      final taskDto = TaskDto.fromMap(map);

      expect(taskDto.task.title, map['title']);
      expect(taskDto.task.content, map['content']);
      expect(taskDto.task.completed, map['completed']);
    });

    test('should convert TaskDto to map', () {
      final task =
          Task(title: 'Test Title', content: 'Test Content', completed: true);
      final taskDto = TaskDto(task: task);

      final map = taskDto.toMap();

      expect(map['title'], task.title);
      expect(map['content'], task.content);
      expect(map['completed'], task.completed);
    });

    test('should maintain equality between Task and TaskDto conversions', () {
      final task =
          Task(title: 'Test Title', content: 'Test Content', completed: true);
      final taskDto = TaskDto(task: task);

      final fromMap = TaskDto.fromMap(taskDto.toMap());

      expect(fromMap.task, task);
    });
  });
}
