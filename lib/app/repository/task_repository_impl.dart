import 'package:isar/isar.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';

import './task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Isar _database;
  
  TaskRepositoryImpl({
    required Isar database,
  }) : _database = database;

  @override
  Future<List<Task>?> getTasks() async{
    return  _database.tasks.where().findAll();
  }
}
