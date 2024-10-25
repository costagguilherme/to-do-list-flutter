import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          const Text('Nova tarefa', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
                color: Colors.black12),
            height: 650,
            width: 375,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: difficultyController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: imageController,
                    textAlign: TextAlign.center,
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Image.asset('assets/images/withoutimage.webp', fit: BoxFit.cover);
                        },
                      )
                  ),
                ),

                ElevatedButton(onPressed: () {
                  print(nameController.text);
                  print(difficultyController.text);
                  print(imageController.text);
                }, child: Text('Ola'))
              ],
            ),
          ),
        ));
  }
}
