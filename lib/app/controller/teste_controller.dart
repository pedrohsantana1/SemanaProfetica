import 'package:meta/meta.dart';
import 'package:get/get.dart';
import 'package:semana_profetica/app/data/model/teste-model.dart';
import 'package:semana_profetica/app/data/repository/teste_repository.dart';

class HomeController extends GetxController {

final MyRepository repository;
HomeController({@required this.repository}) : assert(repository != null);

  final _obj = List<Data>().obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  Future getAll() async{
    await repository.getAll().then((data){
        obj = data;
    });
    print("Jumento "+obj[1].state.toString());
  }
}


