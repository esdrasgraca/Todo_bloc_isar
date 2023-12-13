import 'package:todo_bloc_isar/app/data/models/task.dart';

abstract interface class TaskRepository {
  Future<List<Task>?> getTasks();
}