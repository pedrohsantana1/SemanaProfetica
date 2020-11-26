import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/model/pedido-model.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class PedidoApiClient {

final http.Client httpClient;
PedidoApiClient({@required this.httpClient});


getAll() async {
  try {
    var response = await httpClient.get(baseUrl);
    if(response.statusCode == 200){
      Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<Pedido> listMyModel = jsonResponse['data'].map<Pedido>((map) { 
          return Pedido.fromJson(map);
        }).toList();
      return listMyModel;
    }else print ('erro -get');
  } catch(_){ }
}

getId(id) async {
  try {
      var response = await httpClient.get(baseUrl);
    if(response.statusCode == 200){
      Map<String, dynamic> jsonResponse = json.decode(response.body);
        // TODO: implement methods!
    }else print ('erro -get');
  } catch(_){ }
}

add(obj) async{
  try {
    var response = await httpClient.post( baseUrl,
      headers: {'Content-Type':'application/json'},
      body: jsonEncode(obj) );
    if(response.statusCode == 200){
      // TODO: implement methods!
    }else print ('erro -post'); 
  } catch(_){ }
}

edit(obj) async{
  try {
    var response = await httpClient.put( baseUrl,
      headers: {'Content-Type':'application/json'},
      body: jsonEncode(obj) );
    if(response.statusCode == 200){
      // TODO: implement methods!
    }else print ('erro -post'); 
  } catch(_){ }
}

delete(obj) async{
  try {
    var response = await httpClient.delete( baseUrl);
      if(response.statusCode == 200){
        // TODO: implement methods!
      }else print ('erro -post'); 
  } catch(_){ }
}

}