import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/helper/crud-helper.dart';
import 'package:semana_profetica/app/data/model/pedido-model.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class PedidoApiClient {

final http.Client httpClient;
PedidoApiClient({@required this.httpClient});
var _db = CrudHelper();

  cadastrar(Pedido pedido) async {
      _db.salvarPedido(pedido);
      print("Chegou aqui");
  }

  atualizar(Pedido pedido) async{
    return _db.atualizarPedido(pedido);
  }

  excluir(Pedido pedido) async{
    return _db.excluirPedido(pedido);
  }

  carregarPedidos(String idusuario, String titulo) async{
    return await _db.recuperarPedido(idusuario, titulo);
  }

}