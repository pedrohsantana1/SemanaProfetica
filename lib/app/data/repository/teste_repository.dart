import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/provider/teste_provider.dart';

class MyRepository {

final MyApiClient apiClient;

MyRepository({@required this.apiClient}) : assert(apiClient != null);

getAll(){
  return apiClient.getAll();
}


}