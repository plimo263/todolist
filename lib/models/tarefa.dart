class Tarefa {
  String titulo;
  bool concluido;

  Tarefa(this.titulo, this.concluido);

  set setConculida(inConcluido) => concluido = inConcluido;

  @override
  String toString() {
    return 'Tarefa($titulo, $concluido)';
  }
}
