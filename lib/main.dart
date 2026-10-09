import 'package:academia_flutter/telas/autenticacao_tela.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // <--- Adicionado
import 'firebase_options.dart'; // <--- Adicionado

void main() async { // <--- Adicionado o "async"
  // Garante que o Flutter configure os canais nativos antes de chamar o Firebase
  WidgetsFlutterBinding.ensureInitialized(); // <--- Adicionado

  // Inicializa o Firebase com as configurações do seu projeto
  await Firebase.initializeApp( // <--- Adicionado
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug do canto da tela (opcional)
      home: AutenticacaoTela(),
    );
  }
}