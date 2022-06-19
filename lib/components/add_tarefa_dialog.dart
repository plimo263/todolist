import 'package:flutter/material.dart';
import 'package:todolist/models/tarefa.dart';

class AddTarefaDialog extends StatefulWidget {
  const AddTarefaDialog({Key? key}) : super(key: key);

  @override
  State<AddTarefaDialog> createState() => _AddTarefaDialogState();
}

class _AddTarefaDialogState extends State<AddTarefaDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? _tarefa;
  bool _isConcluida = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height / 2,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) {
                  if (value != null) {
                    _tarefa = value;
                    setState(() {});
                  }
                },
                validator: ((value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return '* Requerido';
                    }
                    return null;
                  }
                  return '* Requerido';
                }),
                decoration: const InputDecoration(
                  labelText: 'Tarefa',
                  hintText: 'Digite o nome da tarefa',
                ),
              ),
              SwitchListTile(
                title: const Text('Tarefa concluida'),
                value: _isConcluida,
                onChanged: (inValue) {
                  _isConcluida = inValue;
                  setState(() {});
                },
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(context, Tarefa(_tarefa!, _isConcluida));
                    }
                  },
                  child: const Text('Adicionar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
