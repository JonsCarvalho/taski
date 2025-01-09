class Task {
  final String title;
  final String content;
  final bool completed;

  Task({
    required this.title,
    required this.content,
    this.completed = false,
  });

  Task copyWith({
    String? title,
    String? content,
    bool? completed,
  }) {
    return Task(
      title: title ?? this.title,
      content: content ?? this.content,
      completed: completed ?? this.completed,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          content == other.content &&
          completed == other.completed);

  @override
  int get hashCode => title.hashCode ^ content.hashCode ^ completed.hashCode;

  @override
  String toString() {
    return 'Task(title: $title, content: $content, completed: $completed)';
  }
}
