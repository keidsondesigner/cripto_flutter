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

  appBarDinamica() {
    if (moedasSelecionadas.isEmpty) {
      return AppBar(
        title: const Text('Cripto Moedas'),
      );
    } else {
      return AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                moedasSelecionadas = [];
              });
            }),
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // Alinhando o texto à direita
          children: [
            Text('${moedasSelecionadas.length} moedas selecionadas'),
          ],
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: Colors.blueGrey[50],
        iconTheme: const IconThemeData(color: Colors.black87),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      //appBar: AppBar(
      // body: const Center(
      //   child: Text('Body - Olá mundo!'),
      // ),
      //)
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
          itemCount: tabela.length),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: moedasSelecionadas.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              label: const Text(
                'FAVORITAR',
                style: TextStyle(
                    letterSpacing: 0,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
    );
  }
}
