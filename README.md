# Academia Flutter 🏋️

Aplicativo desenvolvido em **Flutter e Dart** para organizar exercícios de academia, consultar instruções de execução e acompanhar registros relacionados à experiência durante os treinos.

O projeto utiliza **Firebase Authentication** para autenticação de usuários e possui componentes reutilizáveis para padronizar elementos visuais e mensagens de feedback.

## ✨ Funcionalidades

- **Cadastro de usuários:** criação de contas com nome, e-mail e senha.
- **Login e logout:** autenticação e encerramento de sessão utilizando Firebase Authentication.
- **Controle de acesso:** direcionamento automático para a tela inicial ou para a tela de autenticação, conforme o estado da sessão.
- **Validação de formulários:** verificações dos campos de e-mail, senha e nome.
- **Tratamento de erros:** exibição de mensagens de feedback por meio de SnackBars.
- **Visualização de exercícios:** apresentação do nome do exercício, identificação do treino e instruções de execução.
- **Registros de sentimentos:** exibição de registros com descrição e data.
- **Componentes reutilizáveis:** centralização de cores, estilos dos campos de autenticação e mensagens de feedback.

> **Estado atual:** os exercícios e os registros de sentimentos exibidos na tela de exercícios são exemplos definidos diretamente no código. As operações de adicionar e excluir registros e as opções de fotografia ainda não estão implementadas. A persistência desses dados em um banco de dados também não está demonstrada na versão atual.

## 🧰 Tecnologias utilizadas

- **Flutter:** desenvolvimento da interface da aplicação.
- **Dart:** linguagem de programação.
- **Firebase Core:** inicialização e configuração do Firebase.
- **Firebase Authentication:** gerenciamento da autenticação de usuários.
- **Material Design:** componentes visuais e elementos de interface do Flutter.

## 🗂️ Estrutura do projeto

Com base nos arquivos desenvolvidos até o momento, a estrutura identificada é:

```text
lib/
├── _comum/
│   ├── meu_snackbar.dart
│   └── minhas_cores.dart
├── componentes/
│   └── decoracao_campo_autenticacao.dart
├── modelos/
│   ├── exercicio_modelo.dart
│   └── sentimento_modelo.dart
├── servicos/
│   └── autenticacao_servico.dart
├── telas/
│   ├── autenticacao_tela.dart
│   ├── exercicio_tela.dart
│   └── inicio_tela.dart
├── firebase_options.dart
└── main.dart
```

### Organização das responsabilidades

| Arquivo | Responsabilidade |
|---|---|
| `main.dart` | Inicializa o Firebase e controla o direcionamento conforme a autenticação. |
| `autenticacao_tela.dart` | Interface de login e cadastro, com validação de formulários. |
| `autenticacao_servico.dart` | Centraliza as operações de cadastro, login e logout. |
| `inicio_tela.dart` | Apresenta a tela inicial e a opção de encerrar a sessão. |
| `exercicio_tela.dart` | Exibe detalhes de exercícios e registros de sentimentos. |
| `exercicio_modelo.dart` | Define a estrutura dos dados dos exercícios. |
| `sentimento_modelo.dart` | Define a estrutura dos registros de sentimentos. |
| `_comum/minhas_cores.dart` | Centraliza as cores da interface. |
| `_comum/meu_snackbar.dart` | Padroniza mensagens temporárias de feedback. |
| `componentes/decoracao_campo_autenticacao.dart` | Centraliza a aparência dos campos de autenticação. |

## 🔐 Autenticação com Firebase

A aplicação inicializa o Firebase antes de executar a interface. O componente `RoteadorTela` observa as alterações no estado de autenticação por meio de `FirebaseAuth.instance.userChanges()`.

Com base nesse estado:

- Usuários autenticados são direcionados para a tela inicial.
- Usuários não autenticados visualizam a tela de login e cadastro.

A classe `AutenticacaoServico` concentra as operações de autenticação, separando essa responsabilidade da interface.

## ▶️ Como executar o projeto

### Pré-requisitos

- Flutter SDK instalado.
- Dart SDK compatível com a versão do Flutter utilizada.
- Android Studio ou VS Code com suporte ao Flutter.
- Projeto Firebase configurado com o Firebase Authentication habilitado para autenticação por e-mail e senha.

### Instalação

**1. Clone o repositório:**

```bash
git clone https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git
```

**2. Acesse a pasta do projeto:**

```bash
cd academia_flutter
```

**3. Instale as dependências:**

```bash
flutter pub get
```

**4. Configure o Firebase:**

Verifique se o arquivo `firebase_options.dart` corresponde à configuração do seu projeto Firebase. Caso necessário, gere uma configuração para seu próprio projeto utilizando as ferramentas oficiais do FlutterFire.

**5. Confira os dispositivos disponíveis:**

```bash
flutter devices
```

**6. Execute a aplicação:**

```bash
flutter run
```

> **Atenção:** substitua `SEU-USUARIO/SEU-REPOSITORIO` pelo endereço real do repositório. Não publique credenciais privadas, senhas ou arquivos secretos no GitHub.

## 🚀 Próximas melhorias

Algumas evoluções planejadas para o projeto:

- Implementar a persistência dos exercícios e registros de sentimentos.
- Desenvolver as operações de cadastro, edição e exclusão de registros.
- Implementar as funcionalidades de tirar e selecionar fotografias.
- Validar a correspondência entre a senha e sua confirmação.
- Aprimorar as validações de formulários e o tratamento de erros.
- Desenvolver a navegação entre a tela inicial e as funcionalidades de exercícios.
- Adicionar testes automatizados.

## 👨‍💻 Sobre o projeto

O **Academia Flutter** é um projeto de desenvolvimento mobile criado para praticar Flutter, Dart, integração com Firebase, validação de formulários, organização do código e criação de componentes reutilizáveis.

## 📌 Status

🚧 **Em desenvolvimento**

Este projeto faz parte da minha jornada prática de aprofundamento em **Dart, Flutter e desenvolvimento mobile**, com evolução contínua da arquitetura, regras de negócio, persistência e testes.

## 🎓 Agradecimentos

Este projeto foi desenvolvido aplicando os conceitos e boas práticas ensinados pelo **Professor Ricarth Lima**, profissional em desenvolvimento Mobile de extrema relevância no YouTube.
---

Desenvolvido com Flutter 💙