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
            onLongPress: () async {
              await showDialog(
                  context: context,
                  builder: (inContext) {
                    return AlertDialog(
                      title: const Text('Tem certeza ?'),
                      content: const Text(
                          'Se deseja realmente excluir clique em sim'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('NÃO'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            tarefa.removeAt(index);
                            setState(() {});

                            Navigator.pop(context);
                          },
                          child: const Text('SIM'),
                        ),
                      ],
                    );
                  });
            },
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
