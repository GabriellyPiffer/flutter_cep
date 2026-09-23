import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/pessoa.dart';

class HomeScreen extends StatefulWidget {
  final bool temaEscuro;
  final Function(bool) onTemaChange;

  const HomeScreen({
    super.key,
    required this.temaEscuro,
    required this.onTemaChange,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Pessoa> pessoas = [];

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    final lista = prefs.getStringList('pessoas') ?? [];

    if (!mounted) return;

    setState(() {
      pessoas.clear();

      for (var item in lista) {
        final data = jsonDecode(item);

        pessoas.add(
          Pessoa(
            nome: data['nome'],
            cep: data['cep'],
            numero: data['numero'],
            complemento: data['complemento'],
            rua: data['rua'],
            bairro: data['bairro'],
            cidade: data['cidade'],
            uf: data['uf'],
          ),
        );
      }
    });
  }

  Future<void> _excluirPessoa(int index) async {
    final prefs = await SharedPreferences.getInstance();

    final lista = prefs.getStringList('pessoas') ?? [];

    lista.removeAt(index);

    await prefs.setStringList('pessoas', lista);

    if (!mounted) return;

    setState(() {
      pessoas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final corTexto = Theme.of(context).textTheme.bodyLarge?.color;

    return Scaffold(
      appBar: AppBar(title: const Text('Pessoas')),

      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink[700]),
              child: const Center(
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.info, color: Colors.pink),
              title: const Text('Splash'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),

            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.pink),
              title: const Text('Sair'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Tema escuro', style: TextStyle(color: corTexto)),

                Switch(
                  value: widget.temaEscuro,
                  activeThumbColor: Colors.pink[700],
                  activeTrackColor: Colors.pink[200],
                  inactiveThumbColor: Colors.pink[700],
                  inactiveTrackColor: Colors.pink[200],
                  onChanged: widget.onTemaChange,
                ),
              ],
            ),
          ),

          Expanded(
            child: pessoas.isEmpty
                ? Center(
                    child: Text(
                      'Nenhuma pessoa cadastrada',
                      style: TextStyle(color: corTexto),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: pessoas.length,
                    itemBuilder: (context, index) {
                      final pessoa = pessoas[index];

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.person, color: Colors.pink),

                          title: Text(
                            pessoa.nome,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: corTexto,
                            ),
                          ),

                          subtitle: Text(
                            'CEP: ${pessoa.cep}',
                            style: TextStyle(
                              color: corTexto?.withValues(alpha: 0.8),
                            ),
                          ),

                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.pink[700]),
                            onPressed: () => _excluirPessoa(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[700],
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/cadastro');

          if (!mounted) return;

          if (result != null && result is Pessoa) {
            setState(() {
              pessoas.add(result);
            });

            final prefs = await SharedPreferences.getInstance();

            if (!mounted) return;

            final lista = prefs.getStringList('pessoas') ?? [];

            lista.add(
              jsonEncode({
                'nome': result.nome,
                'cep': result.cep,
                'numero': result.numero,
                'complemento': result.complemento,
                'rua': result.rua,
                'bairro': result.bairro,
                'cidade': result.cidade,
                'uf': result.uf,
              }),
            );

            await prefs.setStringList('pessoas', lista);
          }
        },
      ),
    );
  }
}
