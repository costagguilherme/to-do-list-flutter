import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/task.dart';
import 'package:primeiro_projeto_flutter/data/task_dao.dart';
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
          actions: [
            IconButton(onPressed: () {setState(() {

            });}, icon: Icon(Icons.refresh))
          ],
          title: const Text('Tarefas', style: TextStyle(color: Colors.white))),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                      child: Column(children: [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ]));
                case ConnectionState.waiting:
                  return Center(
                      child: Column(children: [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ]));
                case ConnectionState.active:
                  return Center(
                      child: Column(children: [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ]));
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task task = items[index];
                            return task;
                          });
                    }
                    return Center(
                      child: Column(children: [
                        Icon(Icons.error_outline, size: 128),
                        Text('Não há nenhuma tarefa',
                            style: TextStyle(fontSize: 32))
                      ]),
                    );
                  }
                  return Text('Erro carregar tarefas');
              }
              return Text('Erro desconhecido');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (newContext) => FormScreen(taskContext: context)
              )
          ).then((value) => setState(() {print('Recarregando tela');}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
