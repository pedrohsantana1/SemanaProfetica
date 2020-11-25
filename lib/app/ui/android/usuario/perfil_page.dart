import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:semana_profetica/app/controller/user_controller.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';

class PerfilPage extends GetView<UserController> {
  final UserController _userController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final Usuario user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
            child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48.0,
                  child: Image.asset("assets/perfil.png"),
                ),
              
              SizedBox(
                height: 20,
              ),

              Center(
                child: Text(user.nome , style: TextStyle(fontSize: 20),),
              ),

              SizedBox(
                height: 48,
              ),

              TextFormField(
                controller: _userController.emailTextController,
                validator: (value){
                  if(value.isEmpty){
                    return "Campo obrigatório.";
                  }else if( !GetUtils.isEmail(value) ){
                    return "Campo requer um E-mail válido.";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                enabled: false,
                decoration: InputDecoration(
                  hintText: user.email,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),

              SizedBox(height: 6.0),

              TextFormField(
                controller: _userController.enderecoTextController,
                validator: (value){
                  if(value.isEmpty){
                    return "Campo obrigatório.";
                  }
                  return null;
                },
                keyboardType: TextInputType.streetAddress,
                autofocus: false,
                enabled: false,
                decoration: InputDecoration(
                  hintText: user.endereco,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              SizedBox(height: 6.0),
              TextFormField(
                controller: _userController.dataTextController,
                validator: (value){
                  if(value.isEmpty){
                    return "Campo obrigatório.";
                  }
                  return null;
                },
                keyboardType: TextInputType.datetime,
                autofocus: false,
                enabled: false,
                decoration: InputDecoration(
                  hintText: user.dataAniversario,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              SizedBox(height: 6.0),
              TextFormField(
                controller: _userController.telefoneTextController,
                validator: (value){
                  if(value.isEmpty){
                    return "Campo obrigatório.";
                  }else if( !GetUtils.isPhoneNumber(value) ){
                    return "Campo requer um Telefone válido.";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                autofocus: false,
                enabled: false,
                decoration: InputDecoration(
                  hintText: user.telefone,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //Text("Lista:"+_teste.nome.toString()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  onPressed: () {
                      _userController.logout();
                  },
                  padding: EdgeInsets.all(12),
                  color: Get.theme.primaryColor,
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.HOME, arguments: user);
                  },
                  child: Text(
                    "Voltar para home",
                    style: TextStyle(color: Get.theme.primaryColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
