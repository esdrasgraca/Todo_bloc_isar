
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_bloc_isar/app/modules/home/cubit/home_cubit.dart';
import 'package:todo_bloc_isar/app/modules/home/home_page.dart';
import 'package:todo_bloc_isar/app/repository/task_repository.dart';
import 'package:todo_bloc_isar/app/repository/task_repository_impl.dart';

class HomeRoute {
  Widget page(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskRepository>(create: (context) => TaskRepositoryImpl(database: context.read())),
        Provider(create: (context) => HomeCubit(repository: context.read())),
       

      ],
      builder: (context, child) => HomePage(controller: context.read()),
    );
  }
}