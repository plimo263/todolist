import 'package:flutter/material.dart';
import 'package:todolist/components/tarefa.dart';
import 'package:todolist/models/tarefa.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Tarefa tarefa = Tarefa('Arrumar casa', false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TarefaWidget(
            tarefa: tarefa,
            onClick: (inValue) {
              tarefa.setConculida = inValue;
              setState(() {});
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
