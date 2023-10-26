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

  void _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) {
    emit(
      TasksLoaded(tasks: event.tasks),
    );
  }

  //Add a task
  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    if (state is TasksLoaded) {
      emit(TasksLoaded(tasks: List.from(state.tasks)..add(event.task)));
    }
  }

  //Update a task by its id
  void _updateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    if (state is TasksLoaded) {
      List<Task> tasks = (state.tasks.map((task) {
        return task.id == event.task.id ? event.task : task;
      })).toList();

      emit(
          TasksLoaded(tasks: tasks),
      );
    }
  }

  void _deleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    if (state is TasksLoaded) {
      List<Task> tasks = state.tasks.where((task) {
        return task.id != event.task.id;
      }).toList();

      emit(
          TasksLoaded(tasks: tasks),
      );
    }
  }
}
