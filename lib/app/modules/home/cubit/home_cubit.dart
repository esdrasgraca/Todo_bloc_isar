import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';
import 'package:todo_bloc_isar/app/repository/task_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TaskRepository _repository;

  HomeCubit({required TaskRepository repository})
      : _repository = repository,
        super(HomeInitial()) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    emit(HomeLoading());

    final tasks = await _repository.getTasks();
    emit(HomeLoaded(tasks: tasks));
  }
}
