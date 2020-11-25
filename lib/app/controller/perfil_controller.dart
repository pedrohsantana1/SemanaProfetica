import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/repository/user_repository.dart';

class PerfilController extends GetxController {

final UserRepository repository;
PerfilController({@required this.repository}) : assert(repository != null);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

}