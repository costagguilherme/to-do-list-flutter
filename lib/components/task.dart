import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int level;

  const Task(
      {super.key,
        required this.name,
        required this.photo,
        required this.level});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.blue),
          ),
          Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: (BorderRadius.circular(4)),
                      color: Colors.white),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black26),
                          width: 72,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(widget.photo,
                                fit: BoxFit.cover),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(widget.name,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      overflow: TextOverflow.ellipsis))),
                          Difficulty(difficultyLevel: widget.level,)
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        child: const Icon(Icons.arrow_drop_up),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                            value: (widget.level > 0)
                                ? (nivel / widget.level) / 10
                                : 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Nivel: $nivel',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}