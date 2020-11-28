import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:semana_profetica/app/controller/user_controller.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';


class CadastroPage extends GetView<UserController> {
  var maskFormatterData = new MaskTextInputFormatter(mask: '##/##/####',);
  var maskFormatterTelefone = new MaskTextInputFormatter(mask: '(##)#####-####',);
  final UserController _userController = Get.find<UserController>();
  //final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              Hero(
                tag: 'hero', 
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48.0,
                  child: Image.asset("assets/logo-nome.png"),
                ),
              ),
              SizedBox(height: 15.0),

              TextFormField(
                controller: _userController.nomeTextController,
                validator: (value){
                  if(value.isEmpty){
                    return "Campo obrigatório.";
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Nome",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),

              SizedBox(height: 6.0),

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
                decoration: InputDecoration(
                  hintText: "E-mail",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),

              SizedBox(height: 6.0),

              TextFormField(
                controller: _userController.senhaTextController,
                validator: (value){
                  if(value.isEmpty){
                    return "Campo obrigatório.";
                  }
                  return null;
                },
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Senha",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),

              SizedBox(height: 6.0),

              TextFormField(
                controller: _userController.enderecoTextController,
                keyboardType: TextInputType.streetAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Endereço",
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
                inputFormatters: [maskFormatterData],
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Data de Aniversário",
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
                inputFormatters: [maskFormatterTelefone],
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Telefone",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              SizedBox(height: 6.0),
              SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  onPressed: (){ 
                    if(_formKey.currentState.validate()){
                     if(_userController.enderecoTextController.text.isEmpty){
                       _userController.enderecoTextController.text = "Não informado";
                     }
                      Usuario user = Usuario(
                      nome: _userController.nomeTextController.text,
                       email: _userController.emailTextController.text,
                       senha: _userController.senhaTextController.text,
                       dataAniversario: _userController.dataTextController.text,
                       endereco: _userController.enderecoTextController.text,
                       telefone: _userController.telefoneTextController.text,
                       imagem: null,
                       );
                     circularProgresso(context, _userController, user);
                    }
                  },
                  padding: EdgeInsets.all(12.0),
                  color: Get.theme.primaryColor,
                  child: Text("Cadastrar", style: TextStyle(color: Colors.white)),
                ),
              ),
              FlatButton(
                onPressed: (){ 
                  Get.back();
                }, 
                child: Text("Voltar para Login", style: TextStyle(color: Get.theme.primaryColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  circularProgresso(BuildContext context, UserController _userController, Usuario user) async{

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Cadastrando Usuario"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () async {

      _userController.cadastrar(user);
    

    });

}