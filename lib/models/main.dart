import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  //theme: ThemeData(useMaterial3: true),
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer: Drawer(),
      body: Tasks(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New Task'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(30.0),
          color: Colors.deepPurple[50],
          child: Text('Task 1'),
        ),
        Container(
          padding: EdgeInsets.all(30.0),
          color: Colors.deepPurple[50],
          child: Text('Task 1'),
        ),
      ],
    );
  }
}


