import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  String task;
  String titulo;
  bool finished;
  TaskModel({required this.task, required this.titulo, required this.finished});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'task': task,
      'titulo': titulo,
      'finished': finished
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
        task: map['task'] as String,
        titulo: map['titulo'] as String,
        finished: map['finished'] as bool);
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
