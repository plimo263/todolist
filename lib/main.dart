import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/tarefas.dart';
import 'package:todolist/screens/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context, child) {
        return const TodoApp();
      },
      create: (context) => Tarefas(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(
        title: 'To-do App',
      ),
    );
  }
}
