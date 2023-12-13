import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_isar/app/modules/home/cubit/home_cubit.dart';
import 'package:todo_bloc_isar/app/modules/home/widgets/list_task.dart';

class HomePage extends StatefulWidget {
  final HomeCubit controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          const Center(
            child: Text("Home Page"),
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Center(
                child: switch(state){              
                  HomeInitial() => const SizedBox(),
                  HomeLoading() => const CircularProgressIndicator.adaptive(),              
                  HomeError() => const SizedBox(),              
                  HomeLoaded() => ListTask(tasks: state.tasks),
                },
              );
            },
          )
        ],
      ),
    );
  }
}
