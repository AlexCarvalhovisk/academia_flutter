import 'package:academia_flutter/_comum/minhas_cores.dart';
import 'package:academia_flutter/modelos/exercicio_modelo.dart';
import 'package:academia_flutter/modelos/sentimento_modelo.dart';
import 'package:flutter/material.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  //Aqui instanciei a classe
  final ExercicioModelo exercicioModelo = ExercicioModelo(
    id: "EX001",
    nome: "Remada baixa supinada",
    treino: "Treino A",
    comoFazer: "Segura a barra e puxa!",
  );

  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
      id: "SE001",
      sentindo: "Pouca ativação",
      data: "2026-10-01",
    ),

    SentimentoModelo(
      id: "SE002",
      sentindo: "Já senti pouca ativação",
      data: "2026-10-02",
    ),
  ];

  //Tudo que quero que apareça na tela estou fazendo aqui...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Aqui deixei o fundo do APP azul
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              exercicioModelo.nome,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(exercicioModelo.treino, style: const TextStyle(fontSize: 15)),
          ],
        ),
        centerTitle: true,
        backgroundColor: MinhasCores.azulEscuro,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.vertical(bottom: Radius.circular(32))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Foi clicado no botão.");
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Enviar foto!"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Tirar foto!"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Como fazer?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(exercicioModelo.comoFazer),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, ((index) {
                SentimentoModelo sentimentoAgora = listaSentimentos[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(sentimentoAgora.sentindo),
                  subtitle: Text(sentimentoAgora.data),
                  leading: Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      print("DELETAR ${sentimentoAgora.sentindo}");
                    },
                  ),
                );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
