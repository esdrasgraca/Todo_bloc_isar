
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';

class CoreIsar {
  late final Isar database;

  

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    database = await Isar.open([TaskSchema], directory: dir.path);
  }
}