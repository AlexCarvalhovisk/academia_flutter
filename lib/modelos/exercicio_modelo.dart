class ExercicioModelo {

  String id;
  String nome;
  String treino;
  String comoFazer;

  String? urlImagem;

  ExercicioModelo(
      {required this.id, required this.nome, required this.treino, required this.comoFazer});

  //Aqui a eu recebo informações do banco de dados
  ExercicioModelo.fromMap(Map<String, dynamic> map):
        id = map["id"],
        nome = map["nome"],
        treino = map["treino"],
        comoFazer = map["comoFazer"],
        urlImagem = map["urlImagem"];

  //Aqui a eu envio informações do banco de dados (JSON)
  Map<String, dynamic> toMap(){
    return{
      "id": id,
      "nome": nome,
      "treino": treino,
      "urlImagem": urlImagem
    };
  }
}