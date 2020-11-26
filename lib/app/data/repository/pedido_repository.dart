import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/provider/pedido_provider.dart';

class PedidoRepository {

final PedidoApiClient apiClient;

PedidoRepository({@required this.apiClient}) : assert(apiClient != null);

getAll(){
  return apiClient.getAll();
}
getId(id){
  return apiClient.getId(id);
}
delete(id){
  return apiClient.delete(id);
}
edit(obj){
  return apiClient.edit( obj );
}
add(obj){
    return apiClient.add( obj );
}

}