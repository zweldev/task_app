part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;
  const TaskState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() => {
        'allTasks': this.allTasks.map((e) => e.toMap()).toList(),
      };

  factory TaskState.fromMap(Map<String, dynamic> data) {
    return TaskState(
      allTasks: List<Task>.from(data['allTasks']?.map((e) {
        print("Json data is $data");
        print("e data is $e");
        return Task.fromMap(e);
      })),
    );
  }
}

// class TaskInitial extends TaskState {}

