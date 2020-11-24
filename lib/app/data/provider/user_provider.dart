import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';

const baseUrlLogin = 'https://backend-semana-profetica.herokuapp.com/user/login';
const baseUrlCadastro = 'https://backend-semana-profetica.herokuapp.com/user/cadastro';

class UserApiClient {

final http.Client httpClient;
UserApiClient({@required this.httpClient});




login(String email, String senha) async {
  try {
    Map params = {
      "email" : email,
      "senha" :  senha
    };
    
    var response = await httpClient.post( baseUrlLogin,
      headers: {'Content-Type':'application/json'},
      body: jsonEncode(params));
    if(response.statusCode == 200){
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Usuario.fromJson(jsonResponse['user']);

    }else print ('erro -post'); 
  } catch(teste){ 
    
  }
}

cadastrar(user) async{
  try {

    var response = await httpClient.post( baseUrlCadastro,
      headers: {'Content-Type':'application/json'},
      body: jsonEncode(user)
       
      );
    if(response.statusCode == 200){
      return true;
    }else print ('erro -post' + response.body);

  } catch(_){ }
}




}