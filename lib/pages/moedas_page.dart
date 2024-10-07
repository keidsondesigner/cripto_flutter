import 'package:flutter/material.dart';
import 'package:teste_flutter/repositories/moeda_repository.dart';

class MoedasPage extends StatelessWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Titulo - Cripto Moedas'),
        ),
        // body: const Center(
        //   child: Text('Body - Olá mundo!'),
        // ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int moeda) {
              return ListTile(
                leading: Image.asset(tabela[moeda].icone),
                title: Text(tabela[moeda].nome),
                trailing: Text(tabela[moeda].preco.toStringAsFixed(2)),
              );
            },
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: tabela.length));
  }
}
