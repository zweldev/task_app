import 'package:flutter/material.dart';

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
        return ListTile(
          title: Text(taskList[index].title.toString()),
          trailing: Checkbox(
            onChanged: (value) {},
            value: taskList[index].isDone,
          ),
        );
      },
    );
  }
}
