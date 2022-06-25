import 'package:flutter/material.dart';
import 'package:todolist/database/tarefas_dao.dart';
import 'package:todolist/models/tarefa.dart';

class Tarefas extends ChangeNotifier {
  final List<Tarefa> tarefas;

  Tarefas({required this.tarefas});

  void addTarefa(Tarefa tarefa) async {
    final TarefasDao tarefasDao = TarefasDao();
    final int resultado = await tarefasDao.addTarefa(tarefa);

    if (resultado > 0) {
      tarefa.id = resultado;
      tarefas.add(tarefa);
      notifyListeners();
    } else {
      throw Exception('Erro ao tentar inserir a tarefa no DB.');
    }
  }

  //
  void delTarefa(int index) async {
    Tarefa tarefa = tarefas[index];
    // Exclua a tarefa do banco
    final int resultado = await TarefasDao().delItem(tarefa.id);
    if (resultado > 0) {
      tarefas.removeAt(index);
      notifyListeners();
    } else {
      throw Exception('Erro ao tentar excluir a tarefa.');
    }
  }

  void concluido(int index, bool inValue, int id) async {
    final TarefasDao tarefasDao = TarefasDao();
    final int resultado = await tarefasDao.updTarefa(id, inValue);
    if (resultado > 0) {
      tarefas[index].concluido = inValue;
      notifyListeners();
    } else {
      throw Exception('Erro ao tentar atualizar status da tarefa.');
    }
  }
}
