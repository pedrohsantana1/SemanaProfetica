import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/helper/crud-helper.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';
import 'package:semana_profetica/app/data/repository/user_repository.dart';

class HomeController extends GetxController {

final UserRepository repository;

HomeController({@required this.repository}) : assert(repository != null);

final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
  var _db = CrudHelper();

  Usuario user;

  @override
  void onInit() {
    // É a mesma coisa que initState()
    super.onInit();
    carregarUsuario();
  }

  carregarUsuario() async {
    List usuarioRecuperados = await _db.recuperarUsuario();


      for (var item in usuarioRecuperados) {
        user = Usuario.fromMap(item);
   
      }
 
  }
}