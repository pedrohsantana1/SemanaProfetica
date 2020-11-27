import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:semana_profetica/app/data/model/pedido-outra-model.dart';
import 'package:semana_profetica/app/data/repository/pedido-outra_repository.dart';


class PedidoOutraController extends GetxController {

final PedidoOutraRepository repository;
PedidoOutraController({@required this.repository}) : assert(repository != null);

final TextEditingController texto = TextEditingController();


  @override
  void onInit() {
    // É a mesma coisa que initState()
    super.onInit();

  }


  cadastrar(PedidoOutra pedido) async {
     await repository.cadastrar(pedido);
    // print("Controller " + pedido.id + "titulo "+ pedido.titulo + "pedido "+pedido.pedido + "realizado "+pedido.realizado );
  }
  
  atualizar(PedidoOutra pedido) async{
    int resultado = await repository.atualizar(pedido);
    print("Resultado "+resultado.toString());
  }

  excluir(PedidoOutra pedido) async{
    int resultado = await repository.excluir(pedido);
    print("Excluido"+resultado.toString());
  }

  carregarPedidos(String idusuario, String titulo) async {
    
    List<Map> pedidosRecuperados = await repository.carregarPedidos(idusuario, titulo);
    List<PedidoOutra> listaTemporaria = List<PedidoOutra>();
    print("Outra "+pedidosRecuperados.toString());

    for (var item in pedidosRecuperados) {
        PedidoOutra pedido = PedidoOutra.fromMap(item);
        listaTemporaria.add(pedido);
    }
  
     return listaTemporaria;
 
  }
      

  
}