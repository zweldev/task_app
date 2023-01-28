import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
      // create a list copy of state.allTasks and even.task is added by ..add(event.task)
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    Task task = event.task;
    final index = state.allTasks
        .indexOf(task); // find the index of event.task in state.alltasks
    List<Task> newAllTask = List.from(state.allTasks)
      ..remove(task); // remove the event.task

    task.isDone == false
        ? newAllTask.insert(index, task.CopyWith(newIsDone: true))
        : newAllTask.insert(index, task.CopyWith(newIsDone: false));

    // task.isDone == false
    //     ? newAllTask.add(task.CopyWith(newIsDone: true))
    //     : newAllTask.add(task.CopyWith(newIsDone: false));

    emit(TaskState(allTasks: newAllTask));

    // emit(TaskState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(allTasks: List.from(state.allTasks)..remove(event.task)));
    // emit(TaskState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  @override
  TaskState? fromJson(json) {
    // TODO: implement fromJson
    // throw UnimplementedError();
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    // TODO: implement toJson
    // throw UnimplementedError();
    return state.toMap();
  }
}
