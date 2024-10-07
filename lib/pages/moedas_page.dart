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
                leading: SizedBox(
                  child: Image.asset(tabela[moeda].icone),
                  width: 35,
                ),
                title: Text(
                  tabela[moeda].nome,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                trailing: Text(
                  tabela[moeda].preco.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 14),
                ),
              );
            },
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: tabela.length));
  }
}
