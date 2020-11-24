import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/model/teste-model.dart';

const baseUrl = 'https://covid19-brazil-api.now.sh/api/report/v1';

class MyApiClient {

final http.Client httpClient;
MyApiClient({@required this.httpClient});


getAll() async {
  try {
    var response = await httpClient.get(baseUrl);
    if(response.statusCode == 200){
      Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<Data> listMyModel = jsonResponse['data'].map<Data>((map) { 
          return Data.fromJson(map);
        }).toList();
      return listMyModel;
    }else print ('erro -get');
  } catch(_){ }
}


}