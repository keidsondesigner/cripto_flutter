import 'package:flutter/material.dart';
import 'package:teste_flutter/models/moeda_model.dart';

class MoedaDetalhesPage extends StatefulWidget {
  final MoedaModel moeda;

  MoedaDetalhesPage({super.key, required this.moeda});

  @override
  State<MoedaDetalhesPage> createState() => _MoedaDetalhesPageState();
}

class _MoedaDetalhesPageState extends State<MoedaDetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.moeda.nome),
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  child: Image.asset(widget.moeda.icone),
                  width: 50,
                ),
                Text(widget.moeda.preco.toString()),
              ],
            ),
          ],
        ));
  }
}
