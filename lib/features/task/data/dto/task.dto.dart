import '../../domain/entities/task.entity.dart';

class TaskDto {
  final Task task;

  TaskDto({
    required this.task,
  });

  factory TaskDto.fromDomain(Task task) {
    return TaskDto(task: task);
  }

  Task toDomain() => task;

  factory TaskDto.fromMap(Map<String, dynamic> map) {
    return TaskDto(
      task: Task(
        title: map['title'] as String,
        content: map['content'] as String,
        completed: map['completed'] as bool,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': task.title,
      'content': task.content,
      'completed': task.completed,
    };
  }
}
