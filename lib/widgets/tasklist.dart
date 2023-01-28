import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';

import '../models/task.dart';

class TaskListEXP extends StatelessWidget {
  TaskListEXP({super.key, required this.taskList});

  //  List<Task> taskList = [
  //   Task(title: "Task 1"),
  //   Task(title: "Task 2"),
  //   Task(title: "Task 3")
  // ];

  List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) {

        // Task Tile
        return ListTile(
          title: Text(
            taskList[index].title.toString(),
            style: TextStyle(
                decoration: taskList[index].isDone!
                    ? TextDecoration.lineThrough
                    : null),
          ),
          trailing: Checkbox(
            onChanged: (value) {
              context.read<TaskBloc>().add(UpdateTask(task: taskList[index]));
            },
            value: taskList[index].isDone,
          ),
          onLongPress: () {
            context.read<TaskBloc>().add(DeleteTask(task: taskList[index]));
          },
        );
      },
    );
  }
}
