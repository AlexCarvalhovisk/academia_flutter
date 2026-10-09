import 'package:academia_flutter/_comum/meu_snackbar.dart';
import 'package:academia_flutter/_comum/minhas_cores.dart';
import 'package:academia_flutter/componentes/decoracao_campo_autenticacao.dart';
import 'package:academia_flutter/servicos/autenticacao_servico.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  //Aqui são os controladores dos campos do fomulário.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  AutenticacaoServico _autenServico = AutenticacaoServico();

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
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration(
                          "E-mail: ",
                        ),
                        validator: (String? value) {
                          if (value == null) {
                            return "O e-mail não pode ser vazio.";
                          }
                          if (value.length < 5) {
                            return "O e-mail é muito curto!";
                          }
                          if (!value.contains("@")) {
                            return "Não é um e-mail válido!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getAuthenticationInputDecoration("Senha: "),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "A senha não pode ser vazia.";
                          }
                          if (value.length < 3) {
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
                              decoration: getAuthenticationInputDecoration(
                                "Confirme a senha.",
                              ),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null) {
                                  return "A confirmação de senha não pode ser vazia.";
                                }
                                if (value.length < 3) {
                                  return "A confirmação de senha é muito curta!";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _nomeController,
                              decoration: getAuthenticationInputDecoration(
                                "Nome: ",
                              ),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O nome não pode ser vazio.";
                                }
                                if (value.length < 2) {
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

  botaoPrincipalClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada validada!");
        _autenServico.logarUsuarios(email: email, senha: senha).then((String? erro){
          if(erro != null){
            mostrarSnackBar(context: context, texto: erro);
          }
        });
      } else {
        print("Cadastro validado");
        print(
          "${_emailController.text},${_senhaController.text}, ${_nomeController.text}",
        );
        _autenServico
            .cadastrarUsuario(nome: nome, email: email, senha: senha)
            .then((String? erro) {
              if (erro != null) {
                //Voltou com erro.
                mostrarSnackBar(context: context, texto: erro);
              }
            });
      }
    } else {
      print("Formulário inválido!");
    }
  }
}
