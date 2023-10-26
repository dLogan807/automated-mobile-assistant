import 'package:automated_mobile_assistant/blocs/tasks/tasks_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
      ),
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          if (state is TasksLoading) {
            return const CircularProgressIndicator();
          }
          else if (state is TasksLoaded) {
            return const Text('test');
          }
          else {
            return const Text('Unable to load tasks.');
          }
        },
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New Task'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}