import '../repositories/repositories.dart';

class Task {
  int? id;
  String description;
  bool complete;

  Task({
    this.id,
    this.description = '',
    this.complete = false,
  });

  Task.fromModel(Model model) : this(
    id: model.id,
    description: model.data['description'],
    complete: model.data['complete'],
  );

  Model toModel() => Model(
    id: id as int,
    data: {
      'description': description,
      'complete': complete,
    },
  );

}