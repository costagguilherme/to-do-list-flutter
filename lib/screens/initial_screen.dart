import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/task.dart';
import 'package:primeiro_projeto_flutter/data/task_inherited.dart';
import 'package:primeiro_projeto_flutter/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Container(),
          title: const Text('Tarefas', style: TextStyle(color: Colors.white))),
      body: ListView(
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 8, bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (newContext) => FormScreen(taskContext: context)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}