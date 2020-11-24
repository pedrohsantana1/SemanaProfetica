import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:semana_profetica/app/controller/user_controller.dart';
import 'package:semana_profetica/app/routes/app_routes.dart';

class LoginPage extends GetView<UserController> {
  final UserController _userController = Get.find();
  final _formKey = GlobalKey<FormState>();


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
              Image.asset(
                "assets/logo-nome.png",
              ),
              SizedBox(
                height: 48,
              ),
              TextFormField(
                controller: _userController.loginEmailTextController,
                validator: (value){
                    if(value.isEmpty){
                      return "Campo obrigatório.";
                    }else if( !GetUtils.isEmail(value) ){
                      return "Campo requer um Email válido.";
                    }
                    return null;
                  },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _userController.loginSenhaTextController,
                validator: (value){
                    if(value.isEmpty){
                      return "Campo obrigatório.";
                    }
                    return null;
                  },
                obscureText: true,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Senha",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
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
                    if(_formKey.currentState.validate()){
                     _userController.login(
                        _userController.loginEmailTextController.text,
                        _userController.loginSenhaTextController.text);
                    
                    }
                  },
                  padding: EdgeInsets.all(12),
                  color: Get.theme.primaryColor,
                  child: Text(
                    "Acessar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Esqueceu a senha?",
                    style: TextStyle(color: Get.theme.primaryColor),
                  )),
              FlatButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text(
                    "Cadastrar-se",
                    style: TextStyle(color: Get.theme.primaryColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
