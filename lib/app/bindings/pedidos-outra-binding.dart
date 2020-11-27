import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semana_profetica/app/controller/pedido-outra-controller.dart';
import 'package:semana_profetica/app/data/provider/pedido-outra-provider.dart';
import 'package:semana_profetica/app/data/repository/pedido-outra_repository.dart';


class PedidoOutraBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<PedidoOutraController>(() => PedidoOutraController(
    repository: PedidoOutraRepository(
    apiClient: PedidoOutraApiClient(httpClient: http.Client()))));
  }
}