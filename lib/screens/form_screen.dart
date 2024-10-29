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
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            title:
            const Text('Nova tarefa', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: SingleChildScrollView(
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
                        validator: (String? value){
                          if (value != null && value.isEmpty) {
                            return 'Insira o nome da Tarefa';
                          }
                          return null;
                        },
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
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
                        validator: (value) {
                          if (value!.isEmpty || int.parse(value) > 5 || int.parse(value) < 1) {
                              return 'Insira uma dificuldade entre 1 e 5';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
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
                        keyboardType: TextInputType.url,
                        controller: imageController,
                        textAlign: TextAlign.center,
                        onChanged: (text) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira uma URL de imagem';
                          }
      
                          return null;
                        },
                        decoration: const InputDecoration(
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
                      if (_formKey.currentState!.validate()) {
                        print(nameController.text);
                        print(difficultyController.text);
                        print(imageController.text);
                      }

                    }, child: const Text('Ola'))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}