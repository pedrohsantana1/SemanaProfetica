import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semana_profetica/app/controller/initial_controller.dart';
import 'package:semana_profetica/app/data/provider/user_provider.dart';
import 'package:semana_profetica/app/data/repository/user_repository.dart';

class InitialBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<InitialController>(() => InitialController(
    repository: UserRepository(
    apiClient: UserApiClient(httpClient: http.Client()))));
  }
}