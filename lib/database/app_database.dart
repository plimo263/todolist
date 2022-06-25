import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/database/tarefas_dao.dart';

Future<Database> getDataBase() async {
  final String pathDB = await getDatabasesPath();
  final String path = join(pathDB, 'tarefa.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TarefasDao.tableSQL);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
