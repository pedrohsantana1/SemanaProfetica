import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/helper/crud-helper.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';
import 'package:semana_profetica/app/data/repository/user_repository.dart';

class InitialController extends GetxController {

  final UserRepository repository;

  InitialController({@required this.repository}) : assert(repository != null);

  var verifica = "1" .obs;
  set obj(value) => this.verifica.value = value;
  get obj => this.verifica.value;

  var _db = CrudHelper();
  


   @override
  void onInit() {
    // É a mesma coisa que initState()
    super.onInit();
    _verificar();
  }


  _verificar() async {
    List usuarioRecuperados = await _db.recuperarUsuario();
    if (usuarioRecuperados.isEmpty) {
        this.verifica.value = "deslogado";
 
    } else {
        this.verifica.value = "logado";
    }

  }
}
