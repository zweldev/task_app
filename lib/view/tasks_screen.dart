import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/widgets/tasklist.dart';

class Task_Screen_EXP extends StatelessWidget {
  Task_Screen_EXP({super.key});

  TextEditingController Controller = TextEditingController();

  void _addtask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: AddTaskScreen(
              titleController: Controller,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> allTask = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: Text("Task App"),
            actions: [
              IconButton(
                  onPressed: () {
                    context
                        .read<TaskBloc>()
                        .add(AddTask(task: Task(title: Controller.text)));
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 25,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("Task")),
                ),
              ),
              Expanded(
                  child: TaskListEXP(
                taskList: allTask,
              )),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addtask(context);
              
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key, required this.titleController});
  TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Add Task",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
            autofocus: true,
            controller: titleController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              // Text(context.watch<TaskBloc>().state.allTasks.toString()),
              ElevatedButton(
                  onPressed: () {
                    Task newTask = Task(title: titleController.text);
                    context
                        .read<TaskBloc>()
                        .add(AddTask(task: Task(title: titleController.text)));

                    Navigator.pop(context);
                  },
                  child: Text("Add"))
            ],
          )
        ],
      ),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    );
  }
}


//part 1 25:48