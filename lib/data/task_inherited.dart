import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task(name: 'Aprender Node', photo: 'assets/images/img.jpg', level: 5),
    Task(name: 'Aprender YOLO', photo: 'assets/images/img.jpg', level: 3),
    Task(name: 'Aprender Laravel', photo: 'assets/images/img.jpg', level: 4),
    Task(name: 'Meditar', photo: 'assets/images/img.jpg', level: 1),
    Task(name: 'Jogar', photo: 'assets/images/img.jpg', level: 2),
  ];

  void createTask(String name, String photo, int difficulty) {
    taskList.add(Task(name: name, photo: photo, level: difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
