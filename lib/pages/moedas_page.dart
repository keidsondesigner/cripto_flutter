import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_flutter/models/moeda_model.dart';
import 'package:teste_flutter/repositories/moeda_repository.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<MoedaModel> moedasSelecionadas = [];

  @override
  Widget build(BuildContext context) {
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
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                leading: (moedasSelecionadas.contains(tabela[moeda]))
                    ? const CircleAvatar(child: Icon(Icons.check))
                    : SizedBox(
                        width: 35,
                        child: Image.asset(tabela[moeda].icone),
                      ),
                title: Text(
                  tabela[moeda].nome,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  real.format(tabela[moeda].preco),
                  style: const TextStyle(fontSize: 14),
                ),
                selected: moedasSelecionadas.contains(tabela[moeda]),
                selectedTileColor: Colors.indigo[50],
                onLongPress: () => {
                  setState(() {
                    (moedasSelecionadas.contains(tabela[moeda]))
                        ? moedasSelecionadas.remove(tabela[moeda])
                        : moedasSelecionadas.add(tabela[moeda]);
                  }),
                  print('Clique longo'),
                  print(tabela[moeda].nome),
                },
              );
            },
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: tabela.length));
  }
}
