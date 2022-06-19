import 'package:flutter/material.dart';
import 'package:todolist/components/add_tarefa_dialog.dart';
import 'package:todolist/components/tarefa.dart';
import 'package:todolist/models/tarefa.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Tarefa> tarefa = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (inContext, index) {
          return TarefaWidget(
            tarefa: tarefa[index],
            onClick: (inValue) {
              if (inValue != null) {
                setState(() {
                  tarefa[index].concluido = inValue;
                });
              }
            },
          );
        },
        itemCount: tarefa.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (inContext) {
                return const AddTarefaDialog();
              }).then((value) {
            if (value != null && value is Tarefa) {
              setState(() {
                tarefa.add(value);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
