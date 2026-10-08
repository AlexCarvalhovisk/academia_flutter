class SentimentoModelo {

  String id;
  String sentindo;
  String data;

  SentimentoModelo(
      {required this.id, required this.sentindo, required this.data});

  //Aqui eu estou recebendo as informações do banco
  //Construtor nomeado para converter em um MAP
  SentimentoModelo.fromMap(Map<String, dynamic> map):
    id = map["id"],
    sentindo = map["sentindo"],
    data = map["data"];

  //Aqui eu envio informações que vem do banco
  //Função para transformar em um MAP
  Map<String, dynamic> toMap(){
    return{
      "id": id,
      "sentindo": sentindo,
      "data": data
    };
  }
}