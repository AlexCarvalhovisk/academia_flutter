import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);
      
      await userCredential.user!.updateDisplayName(nome);
      //Se o cadastro for bem sucedido, botei para retornar null.
      return null;
    } on FirebaseAuthException catch (e) {
      if(e.code == "email-already-in-use") {
        return "O usuário já está cadastrado!";
      }
      return "Erro desconhecido!";
    }
  }
}
