import 'package:flutter/material.dart';

import '../services/viacep_service.dart';
import '../models/pessoa.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final nomeController = TextEditingController();
  final cepController = TextEditingController();
  final numeroController = TextEditingController();
  final complementoController = TextEditingController();
  final ruaController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final ufController = TextEditingController();

  Future<void> consultarCep() async {
    try {
      final data = await ViaCepService.buscarCep(cepController.text);

      if (!mounted) return;

      setState(() {
        ruaController.text = data['logradouro'] ?? '';
        bairroController.text = data['bairro'] ?? '';
        cidadeController.text = data['localidade'] ?? '';
        ufController.text = data['uf'] ?? '';
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> _salvar() async {
    final pessoa = Pessoa(
      nome: nomeController.text,
      cep: cepController.text,
      numero: numeroController.text,
      complemento: complementoController.text,
      rua: ruaController.text,
      bairro: bairroController.text,
      cidade: cidadeController.text,
      uf: ufController.text,
    );

    if (!mounted) return;

    Navigator.pop(context, pessoa);
  }

  Widget _campo(
    String label,
    TextEditingController controller, {
    TextInputType tipo = TextInputType.text,
    Function(String)? onSubmit,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: tipo,
        onSubmitted: onSubmit,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    cepController.dispose();
    numeroController.dispose();
    complementoController.dispose();
    ruaController.dispose();
    bairroController.dispose();
    cidadeController.dispose();
    ufController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Cadastro')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _campo('Nome', nomeController),

            _campo(
              'CEP',
              cepController,
              tipo: TextInputType.number,
              onSubmit: (_) => consultarCep(),
            ),

            _campo('Número', numeroController, tipo: TextInputType.number),

            _campo('Complemento', complementoController),

            _campo('Rua', ruaController, readOnly: true),

            _campo('Bairro', bairroController, readOnly: true),

            _campo('Cidade', cidadeController, readOnly: true),

            _campo('Estado', ufController, readOnly: true),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[700],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _salvar,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
