class Humor {
  String id;
  String titulo;
  String descricao;
  bool permiteVisualizacao;
  int tipoHumor;
  String dataInclusao;
  String dataAlteracao;

  Humor({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.permiteVisualizacao,
    required this.tipoHumor,
    required this.dataInclusao,
    required this.dataAlteracao,
  });
}
