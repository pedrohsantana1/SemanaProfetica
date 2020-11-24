import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';
import 'package:semana_profetica/app/data/repository/user_repository.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';

class UserController extends GetxController {

final UserRepository repository;
final TextEditingController loginEmailTextController = TextEditingController();
final TextEditingController loginSenhaTextController = TextEditingController();
final TextEditingController nomeTextController = TextEditingController();
final TextEditingController emailTextController = TextEditingController();
final TextEditingController senhaTextController = TextEditingController();
final TextEditingController enderecoTextController = TextEditingController();
final TextEditingController dataTextController = TextEditingController();
final TextEditingController telefoneTextController = TextEditingController();

UserController({@required this.repository}) : assert(repository != null);

  final _obj = List<Usuario>().obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;


  login(String email, String senha) async{
    Usuario user = await repository.login(email, senha);
    if(user != null){
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
    else{
      showSnackBar("Atenção", "Usuário não encontrado", Colors.red);
    }
  }

  cadastrar(Usuario user) async{
    var resposta = await repository.cadastrar(user);
    if(resposta == true){
      Get.offAllNamed(Routes.LOGIN);
      showSnackBar("Sucesso", "Usuário cadastrado com sucesso!!", Colors.green);
    }
  }

  void showSnackBar(String titulo, String msg, Color cor){
    Get.snackbar(titulo, msg, 
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: cor,
      colorText: Colors.black
    );
  }

}