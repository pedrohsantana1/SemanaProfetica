import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/helper/crud-helper.dart';
import 'package:semana_profetica/app/data/model/pedido-outra-model.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class PedidoOutraApiClient {

final http.Client httpClient;
PedidoOutraApiClient({@required this.httpClient});
var _db = CrudHelper();

  cadastrar(PedidoOutra pedido) async {
      _db.salvarPedidoOutra(pedido);
      print("Chegou aqui");
  }

  atualizar(PedidoOutra pedido) async{
    return _db.atualizarPedidoOutra(pedido);
  }

  excluir(PedidoOutra pedido) async{
    return _db.excluirPedidoOutra(pedido);
  }

  carregarPedidos(String idusuario, String titulo) async{
    var retorno = await _db.recuperarPedidoOutra(idusuario, titulo);
    print("Retorno provider" + retorno.toString());
    return retorno;
  }

}