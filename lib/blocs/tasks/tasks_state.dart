part of 'tasks_bloc.dart';

//Tasks states
abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksLoading extends TasksState {

}

class TasksLoaded extends TasksState {
  final List<Task> tasks;

  const TasksLoaded({this.tasks = const <Task>[]});

  @override
  List<Object> get props => [tasks];
}
