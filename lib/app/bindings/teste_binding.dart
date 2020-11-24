import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semana_profetica/app/controller/teste_controller.dart';
import 'package:semana_profetica/app/data/provider/teste_provider.dart';
import 'package:semana_profetica/app/data/repository/teste_repository.dart';

class TesteBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController(
    repository: MyRepository(
    apiClient: MyApiClient(httpClient: http.Client()))));
  }
}