import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/difficulty.dart';
import 'package:primeiro_projeto_flutter/data/task_dao.dart';

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int level;

  Task(
      {super.key,
      required this.name,
      required this.photo,
      required this.level});

  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool isAssetImage() {
    if (widget.photo.contains('http')) {
      return false;
    }
    return true;
  }

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
                            child: isAssetImage()
                                ? Image.asset(widget.photo, fit: BoxFit.cover)
                                : Image.network(widget.photo, fit: BoxFit.cover),
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
                          Difficulty(
                            difficultyLevel: widget.level,
                          )
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        onLongPress: () {
                          TaskDao().delete(widget.name);
                        },
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
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
                                ? (widget.nivel / widget.level) / 10
                                : 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Nivel: ${widget.nivel}',
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
