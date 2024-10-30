import 'package:primeiro_projeto_flutter/components/task.dart';
import 'package:primeiro_projeto_flutter/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String sqlTable = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'tasks';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _name = 'name';

  save(Task task) async {
    final Database db = await getDatabase();
    var item = await find(task.name);
    if (item.isEmpty) {
      print('nao existe');
      return await db.insert(_tablename, toMap(task));
    }
    print('Existe');
    return await db.update(_tablename, toMap(task), where: '$_name = ?', whereArgs: [task.name]);
  }

  Future<List<Task>> findAll(Task task) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    print('findAll: ${toList(result)}');
    return toList(result);
  }

  find(String taskName) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename, where: '$_name = ?', whereArgs: [taskName]);
    print('find: ${toList(result)}');
    return toList(result);

  }

  delete(Task task) async {
    final Database db = await getDatabase();
    return await db.delete(_tablename, where: '$_name = ?', whereArgs: [task.name]);
  }

  update(Task task) async {

  }

  List<Task> toList(List<Map<String, dynamic>> tasksMap) {
    final List<Task> taskList = [];
    for (Map<String, dynamic> row in tasksMap) {
      final Task task = Task(
          name: row[_name], photo: row[_image], level: row[_difficulty]);
      taskList.add(task);
    }

    return taskList;
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> taskMap = {};
    taskMap[_name] = task.name;
    taskMap[_difficulty] = task.level;
    taskMap[_image] = task.photo;
    return taskMap;
  }

}