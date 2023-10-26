import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksLoading()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
  }

  void _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) {}

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {}

  void _updateTask(UpdateTask event, Emitter<TasksState> emit) {}

  void _deleteTask(DeleteTask event, Emitter<TasksState> emit) {}
}
