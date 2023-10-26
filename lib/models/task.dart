import 'conditions/condition.dart';

class Task {
  String name;
  String? description;
  bool disabled;

  List<Condition> conditions;

  Task(this.name, this.description, this.disabled, this.conditions);
}