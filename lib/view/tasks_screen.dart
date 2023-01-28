import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/view/my_drawer.dart';
import 'package:task_app/widgets/tasklist.dart';
import '../models/task.dart';

class Task_Screen_EXP extends StatelessWidget {
  Task_Screen_EXP({super.key});

  TextEditingController Controller = TextEditingController();

  void _addtask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (contextor) {
        return SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
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
                      controller: Controller,
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
                              Task newTask = Task(
                                title: Controller.text,
                              );
                              context.read<TaskBloc>().add(
                                  AddTask(task: Task(title: Controller.text)));
                              Controller.clear();
                              Navigator.pop(context);
                            },
                            child: Text("Add"))
                      ],
                    )
                  ],
                ),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              )),
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
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text("Task App"),
            actions: [
              IconButton(
                  onPressed: () {
                    _addtask(context);
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
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("Task ${state.allTasks.length}")),
                ),
              ),
              // ElevatedButton(onPressed: (){
              //    Task newTask = Task(title: Controller.text);
              //       context
              //           .read<TaskBloc>()
              //           .add(AddTask(task: Task(title: Controller.text)));
              // }, child:  Text("Add New")),
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


//part 1 25:48