import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/blocs/bloc/task_bloc.dart';
import 'package:task_app/blocs/bloc_observer.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/view/tasks_screen.dart';

void main() {
  Bloc.observer = TaskApp_Observer();
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<TaskBloc>(
        create: (context) =>
            TaskBloc()..add(AddTask(task: Task(title: "Task 1"))),
        child: Task_Screen_EXP(),
      ),
    );
  }
}
