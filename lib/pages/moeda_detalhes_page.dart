import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_flutter/models/moeda_model.dart';

class MoedaDetalhesPage extends StatefulWidget {
  final MoedaModel moeda;

  MoedaDetalhesPage({super.key, required this.moeda});

  @override
  State<MoedaDetalhesPage> createState() => _MoedaDetalhesPageState();
}

class _MoedaDetalhesPageState extends State<MoedaDetalhesPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment:
                MainAxisAlignment.end, // Alinhando o texto à direita
            children: [
              Text(widget.moeda.nome),
            ],
          ),
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            child: Image.asset(widget.moeda.icone),
                          ),
                          Container(width: 16),
                          Text(real.format(widget.moeda.preco),
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
