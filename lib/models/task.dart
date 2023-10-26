import 'condition.dart';

class Task {
  String name;
  String? description;

  List<Condition> conditions;

  Task(this.name, this.description, this.conditions);
}