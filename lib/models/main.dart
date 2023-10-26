import 'package:automated_mobile_assistant/blocs/tasks/tasks_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:automated_mobile_assistant/screens/home_screen.dart';

void main() => runApp(
  const MyApp(),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()
          ..add(
              LoadTasks(),
          ),),
      ],
      child: MaterialApp(
        title: 'Tasks',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.deepPurple,
          appBarTheme: const AppBarTheme(
            color: Colors.deepPurpleAccent,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}


