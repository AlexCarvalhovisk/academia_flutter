import 'package:academia_flutter/_comum/minhas_cores.dart';
import 'package:academia_flutter/componentes/decoracao_campo_autenticacao.dart';
import 'package:flutter/material.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MinhasCores.azulTopoGradiente,
                  MinhasCores.azulBaixoGradiente,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    //Aqui alinhei a coluna e a linha para imagem ficar no meio da tela.
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/logo.png", height: 128),
                      const Text(
                        "Academia Flutter.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("E-mail: "),
                        validator: (String ? value) {
                          if(value == null){
                            return "O e-mail não pode ser vazio.";
                          }
                          if(value.length < 5){
                            return "O e-mail é muito curto!";
                          }
                          if(!value.contains("@")){
                            return "Não é um e-mail válido!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("Senha: "),
                        obscureText: true,
                        validator: (String ? value) {
                          if(value == null){
                            return "A senha não pode ser vazia.";
                          }
                          if(value.length < 3){
                            return "A senha é muito curta!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getAuthenticationInputDecoration("Confirme a senha."),
                              obscureText: true,
                              validator: (String ? value) {
                                if(value == null){
                                  return "A confirmação de senha não pode ser vazia.";
                                }
                                if(value.length < 3){
                                  return "A confirmação de senha é muito curta!";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: getAuthenticationInputDecoration("Nome: "),
                              validator: (String ? value) {
                                if(value == null){
                                  return "O nome não pode ser vazio.";
                                }
                                if(value.length < 2){
                                  return "O nome é muito curto!";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          botaoPrincipalClicado();
                        },
                        child: Text((queroEntrar) ? "Entrar" : "Cadastrar"),
                      ),
                      Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        },
                        child: Text(
                          (queroEntrar)
                              ? "Ainda não tem um conta? Cadastre-se aqui!"
                              : "Já tem um conta? Entre!",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  botaoPrincipalClicado(){
    if(_formKey.currentState!.validate()){
      print("Formulário válido!");
    }else{
      print("Formulário inválido!");
    }
  }
}
