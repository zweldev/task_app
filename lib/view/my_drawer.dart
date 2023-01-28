import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/task_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
              child: Text(
                "Task Drawer",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'task_screen'),
                  child: ListTile(
                    title: Text("My Tasks"),
                    leading: Icon(Icons.folder_special),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'task_screen'),
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text("bin"),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
