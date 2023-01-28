// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  String title;
  String? id; 
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.title,
    this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task CopyWith({
    String? newTitle,
    bool? newIsDone,
    bool? newIsDeleted,
    String? newId,
  }) {
    return Task(
        title: newTitle ?? this.title,
        id: newId ?? this.id,
        isDone: newIsDone ?? this.isDone,
        isDeleted: newIsDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'id' : id
    };
  }

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      id: data['id'] ?? '',
        title: data['title'] ?? '',
        isDone: data['isDone'],
        isDeleted: data['isDeleted']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, isDone, isDeleted, id];
}
