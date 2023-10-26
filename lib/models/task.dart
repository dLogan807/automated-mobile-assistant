import 'conditions/condition.dart';

class Task {
  int id;
  String name;
  bool disabled;

  List<Condition> conditions;

  Task(this.id, this.name, this.disabled, this.conditions);
}