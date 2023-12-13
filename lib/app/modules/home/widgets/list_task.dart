import 'package:flutter/material.dart';

import 'package:todo_bloc_isar/app/data/models/task.dart';

class ListTask extends StatefulWidget {
  final List<Task>? tasks;

  const ListTask({
    super.key,
    this.tasks,
  });

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final task = widget.tasks![index];
        return ListTile(
          title: Text(
            task.tarefa.toString(),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: widget.tasks?.length ?? 0,
    );
  }
}
