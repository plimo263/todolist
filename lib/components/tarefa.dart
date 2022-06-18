import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';

class TarefaWidget extends StatelessWidget {
  final Tarefa tarefa;
  final Function(bool?) onClick;
  const TarefaWidget({Key? key, required this.tarefa, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        onChanged: onClick,
        value: tarefa.concluido,
        title: Text(
          tarefa.titulo,
          style: TextStyle(
            decoration: tarefa.concluido ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
