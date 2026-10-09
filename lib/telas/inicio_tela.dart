import 'package:academia_flutter/servicos/autenticacao_servico.dart';
import 'package:flutter/material.dart';

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela inicial.")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Deslogar."),
              onTap: () {
                AutenticacaoServico().deslogar();
              },
            ),
          ],
        ),
      ),
    );
  }
}
