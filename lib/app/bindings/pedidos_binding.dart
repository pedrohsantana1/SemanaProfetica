import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semana_profetica/app/controller/pedido_controller.dart';
import 'package:semana_profetica/app/data/provider/pedido_provider.dart';
import 'package:semana_profetica/app/data/repository/pedido_repository.dart';

class PedidoBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<PedidoController>(() => PedidoController(
    repository: PedidoRepository(
    apiClient: PedidoApiClient(httpClient: http.Client()))));
  }
}