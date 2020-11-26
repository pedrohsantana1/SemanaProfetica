import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/repository/pedido_repository.dart';

class PedidoController extends GetxController {

final PedidoRepository repository;
PedidoController({@required this.repository}) : assert(repository != null);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}