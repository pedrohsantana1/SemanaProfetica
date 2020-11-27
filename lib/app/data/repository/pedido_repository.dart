import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/model/pedido-model.dart';
import 'package:semana_profetica/app/data/provider/pedido_provider.dart';

class PedidoRepository {

final PedidoApiClient apiClient;

PedidoRepository({@required this.apiClient}) : assert(apiClient != null);


cadastrar(Pedido pedido){
  return apiClient.cadastrar(pedido);
}

carregarPedidos(String idusuario, String titulo){
  return apiClient.carregarPedidos(idusuario, titulo);
}

}