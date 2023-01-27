part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  AddTask({required this.task});

  @override
  List<Object> get props => [task];
}


class UpdateTask extends TaskEvent {
  final Task task;

  UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;

  DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}