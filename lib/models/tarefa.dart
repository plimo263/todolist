class Tarefa {
  String titulo;
  bool concluido;
  late int id;

  Tarefa(this.titulo, this.concluido);

  set setId(int inID) => id = inID;

  set setConcluido(bool inConcluido) => concluido = inConcluido;

  @override
  String toString() {
    return 'Tarefa($titulo, $concluido)';
  }

  Map<String, dynamic> toMap() {
    return {'nome': titulo, 'concluido': concluido ? 1 : 0};
  }

  Tarefa.fromJSON(Map<String, dynamic> json)
      : titulo = json['nome'],
        concluido = json['concluido'] == 1 ? true : false,
        id = json['id'];
}
