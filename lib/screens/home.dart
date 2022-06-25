import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/add_tarefa_dialog.dart';
import 'package:todolist/components/tarefa.dart';
import 'package:todolist/models/tarefa.dart';
import 'package:todolist/models/tarefas.dart';

class Home extends StatelessWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  // Metodo para deletar item da lista
  void _removerItem(BuildContext context, int index) {
    Provider.of<Tarefas>(context, listen: false).delTarefa(index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Consumer<Tarefas>(
        builder: (context, tarefas, child) {
          return ListView.builder(
            itemBuilder: (inContext, index) {
              return TarefaWidget(
                tarefa: tarefas.tarefas[index],
                onLongPress: () async {
                  await showDialog(
                      context: context,
                      builder: (inContext) {
                        return AlertaExcluao(
                          onClick: () => _removerItem(context, index),
                        );
                      });
                },
                onClick: (inValue) {
                  if (inValue != null) {
                    tarefas.concluido(
                        index, inValue, tarefas.tarefas[index].id);
                  }
                },
              );
            },
            itemCount: tarefas.tarefas.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (inContext) {
                return const AddTarefaDialog();
              }).then((value) {
            if (value != null && value is Tarefa) {
              Provider.of<Tarefas>(context, listen: false).addTarefa(value);
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AlertaExcluao extends StatelessWidget {
  final Function() onClick;
  const AlertaExcluao({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tem certeza ?'),
      content: const Text('Se deseja realmente excluir clique em sim'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('NÃO'),
        ),
        ElevatedButton(
          onPressed: onClick,
          child: const Text('SIM'),
        ),
      ],
    );
  }
}
