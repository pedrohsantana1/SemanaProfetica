import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/model/pedido-outra-model.dart';
import 'package:semana_profetica/app/data/provider/pedido-outra-provider.dart';

class PedidoOutraRepository {

final PedidoOutraApiClient apiClient;

PedidoOutraRepository({@required this.apiClient}) : assert(apiClient != null);


cadastrar(PedidoOutra pedido){
  return apiClient.cadastrar(pedido);
}

atualizar(PedidoOutra pedido){
  return apiClient.atualizar(pedido);
}

excluir(PedidoOutra pedido){
  return apiClient.excluir(pedido);
}

carregarPedidos(String idusuario, String titulo){
  return apiClient.carregarPedidos(idusuario, titulo);
}

}