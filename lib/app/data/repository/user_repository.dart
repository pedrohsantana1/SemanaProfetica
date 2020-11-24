import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/model/user-model.dart';
import 'package:semana_profetica/app/data/provider/user_provider.dart';

class UserRepository {

final UserApiClient apiClient;

UserRepository({@required this.apiClient}) : assert(apiClient != null);



login(String email, String senha){
  return apiClient.login(email, senha);
}

cadastrar(Usuario user){
  return apiClient.cadastrar(user);
}



}