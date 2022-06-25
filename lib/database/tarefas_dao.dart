import 'package:todolist/database/app_database.dart';
import 'package:todolist/models/tarefa.dart';

class TarefasDao {
  static const String table = 'tarefas';
  static const String id = 'id';
  static const String nome = 'nome';
  static const String concluido = 'concluido';

  static String tableSQL = 'CREATE TABLE $table ('
      '$id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$nome TEXT,'
      '$concluido INTEGER'
      ')';

  Future<int> addTarefa(Tarefa tarefa) async {
    final Map<String, dynamic> toMap = tarefa.toMap();

    final db = await getDataBase();
    return await db.insert(TarefasDao.table, toMap);
  }

  // Funcao para atualizar o status de uma tarefa em especifico
  Future<int> updTarefa(int id, bool concluido) async {
    final db = await getDataBase();
    return await db.update(TarefasDao.table, {'concluido': concluido ? 1 : 0},
        where: ' id = ?', whereArgs: [id]);
  }

  // Obtem todos os itens
  Future<List<Tarefa>> findAll() async {
    final db = await getDataBase();
    var itens = await db.query(
      TarefasDao.table,
    );
    List<Tarefa> _tarefas = itens.map((element) {
      return Tarefa.fromJSON(element); // {id: 1, nome: 'nome', 'concluido': 1}
    }).toList();
    return _tarefas;
  }

  // Exclusao de item
  Future<int> delItem(int id) async {
    final db = await getDataBase();
    return await db.delete(TarefasDao.table, where: 'id = ?', whereArgs: [id]);
  }
}
