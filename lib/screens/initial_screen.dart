import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  bool taskOpacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Container(),
          title: const Text('Tarefas', style: TextStyle(color: Colors.white))),
      body: AnimatedOpacity(
        opacity: (taskOpacity) ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                name: 'Aprender Flutter',
                photo: 'assets/images/img.jpg',
                level: 5),
            Task(
                name: 'Aprender YOLO',
                photo: 'assets/images/img.jpg',
                level: 3),
            Task(
                name: 'Aprender Laravel',
                photo: 'assets/images/img.jpg',
                level: 4),
            Task(
                name: 'Meditar',
                photo: 'assets/images/img.jpg',
                level: 1),
            Task(
                name: 'Jogar',
                photo: 'assets/images/img.jpg',
                level: 2),
            SizedBox(height: 70,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            taskOpacity = !taskOpacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}