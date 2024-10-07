import 'package:teste_flutter/models/moeda_model.dart';

class MoedaRepository {
  static List<MoedaModel> tabela = [
    MoedaModel(
      icone: 'images/bitcoin.png',
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 164603.00,
    ),
    MoedaModel(
      icone: 'images/ethereum.png',
      nome: 'Ethereum',
      sigla: 'ETH',
      preco: 1326.00,
    ),
    MoedaModel(
      icone: 'images/solana.png',
      nome: 'Solana',
      sigla: 'SOL',
      preco: 100.00,
    ),
  ];
}
