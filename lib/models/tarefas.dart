import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';

class Tarefas extends ChangeNotifier {
  final List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  void addTarefa(Tarefa tarefa) {
    _tarefas.add(tarefa);
    notifyListeners();
  }

  //
  void delTarefa(int index) {
    _tarefas.removeAt(index);
    notifyListeners();
  }

  void concluido(int index, bool inValue) {
    _tarefas[index].concluido = inValue;
    notifyListeners();
  }
}
