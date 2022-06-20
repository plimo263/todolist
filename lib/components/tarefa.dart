import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';

class TarefaWidget extends StatelessWidget {
  final Tarefa tarefa;
  final Function(bool?) onClick;
  final Function() onLongPress;
  const TarefaWidget(
      {Key? key,
      required this.tarefa,
      required this.onClick,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Card(
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
      ),
    );
  }
}
