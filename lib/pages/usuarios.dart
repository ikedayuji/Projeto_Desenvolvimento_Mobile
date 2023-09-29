import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../models/usuario_model.dart';

class Usuarios extends StatefulWidget {
  @override
  State<Usuarios> createState() {
    return UsuariosState();
  }
}

class UsuariosState extends State<Usuarios> {
  final TextEditingController nomeControl = TextEditingController();
  final TextEditingController telefoneControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  DateTime? dataNascimento;

  // Lista de objetos da classe Usuario
  List<Usuario> _lista = [];

  void _adicionarUsuarioAleatorio() {
    final random = Random();
    final idAleatorio = random.nextInt(70); // Gerar um ID aleatório de 0 a 70
    final urlFoto = 'https://i.pravatar.cc/300?img=$idAleatorio';

    setState(() {
      _lista.add(
        Usuario(
          nome: 'Usuário $idAleatorio',
          email: 'usuario$idAleatorio@mail.com',
          telefone: '123456789',
          dataNascimento: DateTime.now(),
          urlFoto: urlFoto,
        ),
      );
    });
  }

  void _adicionarUsuario() {
    final nome = nomeControl.text;
    final telefone = telefoneControl.text;
    final email = emailControl.text;

    if (nome.isNotEmpty &&
        telefone.isNotEmpty &&
        email.isNotEmpty &&
        dataNascimento != null) {
      setState(() {
        _lista.add(
          Usuario(
            nome: nome,
            email: email,
            telefone: telefone,
            dataNascimento: dataNascimento!,
            urlFoto: 'https://i.pravatar.cc/50?img=${_lista.length}',
          ),
        );
      });

      // Limpar os campos após adicionar o usuário
      nomeControl.clear();
      telefoneControl.clear();
      emailControl.clear();
      dataNascimento = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Usuários")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: nomeControl,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: telefoneControl,
              decoration: const InputDecoration(labelText: "Telefone"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: emailControl,
              decoration: const InputDecoration(labelText: "E-mail"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  dataNascimento == null
                      ? "Data de Nascimento"
                      : DateFormat('dd/MM/yyyy').format(dataNascimento!),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        dataNascimento = pickedDate;
                      });
                    }
                  },
                  child: const Text("Selecionar Data"),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _adicionarUsuario,
            child: const Text("Adicionar Usuário"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _lista.length,
              itemBuilder: (context, index) {
                final usuario = _lista[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(usuario.urlFoto),
                  ),
                  title: Text(usuario.nome),
                  subtitle: Text(usuario.email),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarUsuarioAleatorio,
        child: const Icon(Icons.add),
      ),
    );
  }
}
