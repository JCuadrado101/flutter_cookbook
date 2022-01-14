import 'package:flutter_cookbook/chapter6/models/task.dart';
import '../repositories/repositories.dart';

class Plan {
  int id;
  String? name = '';
  List<Task> tasks = [];
  int get completeCount => tasks.where((task) => task.complete).length;
  String get completenessMessage => '$completeCount of ${tasks.length} tasks completed';

  Plan({required this.id, this.name});

  Plan.fromModel(Model model)
    : id = model.id,
      name = model.data['task'],
      tasks = model.data['task']
          ?.map((task) => Task.fromModel(task))
          ?.toList() ?? <Task>[];

  Model toModel() => Model(id: id, data: {
    'task': name,
    'tasks': tasks.map((task) => task.toModel()).toList()
  });

}