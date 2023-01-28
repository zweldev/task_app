import 'package:flutter/material.dart';

import '../widgets/tasklist.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
          appBar: AppBar(
            title: Text("Task App"),
            actions: [
              IconButton(
                  onPressed: () {
                    
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
                  child: Center(child: Text("Task ")),
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
                taskList: [],
              )),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              
            },
            child: Icon(Icons.add),
          ),
        );;
  }
}