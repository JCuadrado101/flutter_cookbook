import 'package:flutter_cookbook/chapter6/models/task.dart';

class Plan {
  String name = '';
  final List<Task> tasks = [];

  int get completeCount => tasks.where((task) => task.complete).length;

  String get completenessMessage => '$completeCount of ${tasks.length} tasks completed';
}